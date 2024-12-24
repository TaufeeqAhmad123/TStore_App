import 'package:cwt_ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';


/// -- Entry point of Flutter App
Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
 Stripe.publishableKey = dotenv.env["STRIPE_PUBLISHABLE_KEY"] ?? "";
  await Stripe.instance.applySettings();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Overcome from transparent spaces at the bottom in iOS full Mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  /// -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  /// -- Main App Starts here...
  runApp( App());
}
