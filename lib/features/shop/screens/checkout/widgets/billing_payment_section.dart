import 'package:cwt_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/checkout_controller.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: false,
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
            children: [
              TRoundedContainer(
                width: 133,
                height: 35,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: const Row(
                mainAxisSize: MainAxisSize.min,
                  children: [
                  Image(image: AssetImage(TImages.masterCard,), fit: BoxFit.contain),
                   SizedBox(width: 3),
                  Image(image: AssetImage(TImages.creditCard,), fit: BoxFit.contain),
                    SizedBox(width: 3),
                  Image(image: AssetImage(TImages.visa,), fit: BoxFit.contain),
                ],)
              ),
              const SizedBox(width: TSizes.spaceBtwItems ),
              Text('CREDIT CARDS', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        
      ],
    );
  }

}
