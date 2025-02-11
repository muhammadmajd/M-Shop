
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/utils/constents/image_strings.dart';

import '../../../../data/repesitories/authentication/authentication_repository.dart';

import '../../../../data/repesitories/user/user_repository.dart';
import '../../../../utils/check_internet/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState> (); // Form key for form validation
  //final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  /// - - SIGNUP
  ///

  //Future<void> signup() async {
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.successJson);

      // Check Internet Connectivity
      final isConnected = await NetworkManager. instance.isConnected ();

      if (!isConnected) {


        return;
      }


      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();

        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential= await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(),password.text.trim());
      if(kDebugMode){
        print('==============userCredential=====================');
        print(userCredential.user!.uid);
        //39L5EDyoE4ast6RJBShH3bFuewm2

      }
      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text. trim(),
        lastName: lastName. text. trim( ),
        username: username. text. trim(),
        email: email. text.trim(),
        phoneNumber: phoneNumber. text. trim(),
        profilePicture:'',
      );
      if(kDebugMode){
        print('==============newUser=====================');
        print(newUser);
        print(newUser.fullName);
      }

      final userRepository = Get.put (UserRepository() );
      userRepository.saveUserRecord(newUser);
      TFullScreenLoader.stopLoading();
      // Show Success Message
      TLoaders.successSnackBar (title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
      // Move to Verify Email Screen
      Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));
      // Get.to(()=> const LoginScreen());
    }catch (e) {
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar (title: 'Oh Snap!', message: e.toString());
    }finally {
      // Remove Loader
      //TFullScreenLoader.stopLoading();
    }

  }

}