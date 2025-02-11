import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/data/repesitories/authentication/authentication_repository.dart';
import 'package:tinder/utils/constents/sizes.dart';
import 'package:get/get.dart';
import 'package:tinder/utils/constents/image_strings.dart';
import 'package:tinder/utils/helper/helper_functions.dart';
import '../../../../utils/constents/text_strings.dart';
import '../../controllers/signup/verify_email_controller.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,
    this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());

    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect them to the login screen.
      /// This approach is taken to handle scenarios where the user enters the registration process,
      /// and the data is stored. Upon reopening the app, it checks if the email is verified.
      /// If not verified, the app always navigates to the verification screen.
      appBar: AppBar(
        automaticallyImplyLeading: false,// hidding back aow
        actions: [
          IconButton(onPressed:()=> AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
        //leading:Builder(builder: ( context){ return Text('');}) ,
      ),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth() *0.6
              ),
              const SizedBox(height: TSizes.spacesBtwsections),

              /// Title & subTitle
              Text (TTexts.confirmEmail, style: Theme.of(context). textTheme. headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes .spaceBtwItems),
              Text (email?? '', style: Theme.of (context) .textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox (height: TSizes.spaceBtwItems),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context). textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox (height: TSizes.spacesBtwsections),
              ///  Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> controller.checkmailVerificationStatus(),

                  child: const Text (TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox (width: double.infinity,
                  child: TextButton (onPressed: ()=> controller.sendEmailVerification(), child: const Text (TTexts.resendEmail))),
            ],
          ),
        ),

      ),
    );
  }
}
