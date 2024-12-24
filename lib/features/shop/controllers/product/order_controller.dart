import 'dart:convert';

import 'package:cwt_ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:cwt_ecommerce_app/data/services/paypal/paypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/order/order_repository.dart';
import '../../../../home_menu.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import '../checkout_controller.dart';
import 'cart_controller.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.getUserID;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Trigger payment gateway
      if (checkoutController.selectedPaymentMethod.value.name ==
          PaymentMethods.paypal.name) {
        //  await TPaypalService.getPayment();
      }

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
            image: TImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const HomeMenu()),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future createPaymentIntent(
      {required String name,
      required String address,
      required String pin,
      required String city,
      required String state,
      required String country,
      required String currency,
      required double amount}) async {
    final url = Uri.parse('https://api.stripe.com/v1/payment_intents');
    final secretKey = dotenv.env["STRIPE_SCRETE_KEY"];
    final int amountInCents = (amount * 100).toInt();
    final body = {
      'amount': amountInCents.toString(),
      'currency': currency.toLowerCase(),
      'automatic_payment_methods[enabled]': 'true',
      'description': "Test Donation",
      'shipping[name]': name,
      'shipping[address][line1]': address,
      'shipping[address][postal_code]': pin,
      'shipping[address][city]': city,
      'shipping[address][state]': state,
      'shipping[address][country]': country
    };

    final response = await http.post(url,
        headers: {
          "Authorization": "Bearer $secretKey",
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
        
        );

    print(body);
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    // Check if 'client_secret' key exists in the response
    if (json.containsKey('client_secret')) {
      return json;
    } else {
      throw Exception("Key 'client_secret' not found in the response.");
    }
  } else {
    throw Exception("Failed to create payment intent. Status code: ${response.statusCode}");
  }
  }

  Future<void> initPaymentSheet(double amount) async {
    try {
      // 1. create payment intent on the server
      final data = await createPaymentIntent(
        name: addressController.selectedAddress.value.name,
        address: addressController.selectedAddress.value.street,
        city: addressController.selectedAddress.value.city,
        pin: addressController.selectedAddress.value.postalCode,
        state: addressController.selectedAddress.value.state,
        country: addressController.selectedAddress.value.country,
        currency: 'usd',
        amount: amount,
      );
      if (data == null) {
        // throw 'Failed to create payment intent';
      }
  print(data);
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
        
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Test Merchant',
          paymentIntentClientSecret:data["client_secret"],
          // Customer keys
          //customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data["id"],
        ),
      );

      // 3. Display the payment sheet
      await Stripe.instance.presentPaymentSheet();
      TLoaders.successSnackBar(
          title: 'Payment Success', message: 'Your payment was successful!');
          processOrder(amount);
    } catch (e) {
      print(e);
      TLoaders.errorSnackBar(
          title: 'Payment Canceled',
          message: "Your payment has been canceled due to $e.toString()");
      rethrow;
    }
  }
}
