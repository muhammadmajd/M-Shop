import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode (context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        Text ('Coding with 3M', style: Theme.of (context). textTheme. bodyLarge),
        const SizedBox (width: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox (width: TSizes.spaceBtwItems),
            Text ('+7-901-5058234', style: Theme.of (context). textTheme .bodyMedium),

          ],
        ),
        const SizedBox (width: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox (width: TSizes.spaceBtwItems),
            Expanded(child: Text ('Russia, Moscow, Myranovkaia 7B', style: Theme.of (context). textTheme .bodyMedium)),

          ],
        ),
        //TBillingAmountSection()
      ],
    );
  }
}

