import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/features/personalization/controllers/user_controller.dart';

import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/constents/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar (title: const Text ('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all (TSizes.defaultSpace),
         child:  Form(
                  key: controller.reAuthFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // Email
                  TextFormField(
                    controller: controller.verifyEmail,
                      validator: TValidator.validateEmail,
                      decoration: const InputDecoration (prefixIcon: Icon (Iconsax.direct_right), labelText: TTexts.email),
                  )
                      ,
                      const SizedBox (height: TSizes .spaceBtwInputFields),
    Obx (
    () => TextFormField (
        obscureText: controller.hidePassword.value,
        controller: controller.verifyPassword,
        validator: (value) => TValidator. validateEmptyText ('Password', value), decoration: InputDecoration ( labelText: TTexts.password,
        prefixIcon: const Icon (Iconsax.password_check), suffixIcon: IconButton (
        onPressed: () => controller.hidePassword.value = !controller.hidePassword. value,
        icon: const Icon (Iconsax.eye_slash),
    ),
    )
    )
    ),

                      const SizedBox (height: TSizes.spacesBtwsections),

             SizedBox (
                 width: double.infinity,
                  child: ElevatedButton (onPressed: () => controller.reAuthenticateEmailAndPasswordUser()
                      , child: const Text('Verify')), ),



                    ],
                  ),
                )
        ),
      ),
    );
  }
}
