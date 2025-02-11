import 'package:flutter/material.dart';

import 'package:tinder/common/widgets/login_signup/form_divider.dart';
import 'package:tinder/common/widgets/login_signup/social_buttons.dart';
import 'package:tinder/utils/constents/sizes.dart';
import 'package:tinder/utils/constents/text_strings.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import 'widgets/signup_form.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark?Colors.white : Colors.grey, // Change the back arrow color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
    padding: const EdgeInsets.all(TSizes.defaultSpace,),
          child: Column(
            children: [
              /// title
              Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spacesBtwsections,),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spacesBtwsections,),
              /// Divider
               const TFormDivier(dividerText: TTexts.orSignUpwith),
              const SizedBox(height: TSizes.spacesBtwsections,),
              const TSocialButtons()
            ],
          ),
        ),
    ),
    );
  }
}
