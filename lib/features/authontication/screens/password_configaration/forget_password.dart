import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/authontication/controllers/forget_password/forget_password_controller.dart';
import 'package:tinder/utils/constents/sizes.dart';
import 'package:tinder/utils/validators/validation.dart';

import '../../../../utils/constents/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Headings
          Text (TTexts.forgetPasswordTitle, style: Theme.of(context) .textTheme .headlineMedium),
          const SizedBox (height: TSizes.spaceBtwItems),
          Text (TTexts.forgetPasswordSubTitle, style: Theme.of (context).textTheme.labelMedium),
          const SizedBox (height: TSizes.spacesBtwsections * 2),
          /// Text fields
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
             validator: TValidator.validateEmail,
             decoration: const InputDecoration(
                 labelText:TTexts.email,
                 prefixIcon:Icon(Iconsax.direct_right)),),
          ),
          const SizedBox(height:TSizes.spacesBtwsections ,),
          /// Submit Button
          SizedBox(width: double.infinity,
            child: ElevatedButton(
                onPressed: ()=> controller.sendPasswordResetEmail(),
              child: const Text(TTexts.submit)),)
        ],
      ),)
    );
  }
}
