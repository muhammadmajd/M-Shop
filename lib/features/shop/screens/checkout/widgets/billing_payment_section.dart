import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';
class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode (context);
    return   Column(
      children: [
        /// SUbTotal
        TSectionHeading (title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox (height: TSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment. spaceBetween,
          children: [
            TRoundedContainer( width: 60, height: 35,
              backgroundColor: dark ? TColors.light : TColors.white, padding: const EdgeInsets.all (TSizes.sm),
              child: const Image (image: AssetImage (TImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox (height: TSizes.spaceBtwItems / 2),
            Text ('Paypal', style: Theme.of (context). textTheme .bodyLarge),
          ],
        ),


      ],
    );
  }
}
