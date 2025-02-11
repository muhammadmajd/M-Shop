
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/constents/text_strings.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermAndCondition extends StatelessWidget {
  const TTermAndCondition({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row( children: [

      SizedBox (width: 24, height: 24, child: Obx(()=> Checkbox (value: controller.privacyPolicy.value,
          onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value)),),
      const SizedBox(width: TSizes.spaceBtwItems),
      Expanded(
        child: Text.rich(
          TextSpan (children: [
            TextSpan (text: '${TTexts.iAgreeTo} ', style: Theme.of (context). textTheme.headlineSmall),//
            TextSpan (text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.headlineSmall!.apply (
              color: dark ? TColors.white : TColors.primary, decoration: TextDecoration.underline,
              decorationColor: dark ? TColors.white : TColors.primary,
            )),
            TextSpan (text: '${TTexts.and} ', style:  Theme.of(context).textTheme.headlineSmall),
            TextSpan (text: TTexts.termsofUse, style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: dark ? TColors.white: TColors.primary, decoration: TextDecoration.underline,
              decorationColor: dark ? TColors.white : TColors.primary,
            )),

          ]),

        ),
      ),

    ]);
  }
}
