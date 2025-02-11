import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/features/authontication/controllers/login/login_controller.dart';
import 'package:tinder/features/authontication/screens/password_configaration/forget_password.dart';
import 'package:tinder/features/authontication/screens/signup/signup.dart';
import 'package:tinder/utils/validators/validation.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/constents/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(LoginController());
    return Form (
        key: controller.loginFormKey,
        child:
          Padding(

      padding: const EdgeInsets.symmetric(vertical: TSizes.spacesBtwsections),
      child: Column(
        children: [
          /// Email
          TextFormField(
            controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration:const InputDecoration (prefixIcon: Icon (Iconsax.direct_right), labelText: TTexts.email)),
          const SizedBox (height: TSizes.spaceBtwInputFields),
          /// Password
          Obx(
                ()=> TextFormField(
              validator: (value)=> TValidator.validatePassword( value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: ()=> controller.hidePassword.value= !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye))
              ),
            ),
          ),
          const  SizedBox (height: TSizes.spaceBtwInputFields /2),
          /// Remember me & Forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              Row(
                children: [
                  Obx(()=> Checkbox(value: controller.rememberMe.value,
                      onChanged: (value)=>controller.rememberMe.value = !controller.rememberMe.value)),
                  const Text(TTexts.rememberMe)
                ],
              ),
              /// Forget Password

              TextButton(onPressed:  () =>Get.to(()=> const ForgetPasswordScreen()), child: const Text(TTexts.forgetPassword))

            ],
          ),

          const  SizedBox (height: TSizes.spacesBtwsections),
          /// Sign In Button
          SizedBox (width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.to(()=>const NavigationMenu()), child: const Text (TTexts.signin))),
          const  SizedBox (height: TSizes.spaceBtwItems),
          /// Create  Account Button
          SizedBox (width: double.infinity, child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey[300]), // Set the background color
                foregroundColor: WidgetStateProperty.all(Colors.white), // Set the text color
              ),
              //onPressed: () => controller.emailAndPasswordSignIn(),
              onPressed: () => Get.to(const SignupScreen()),
              child: const Text (TTexts.createAccount))),


        ],
      ),
    )
    );
  }
}
