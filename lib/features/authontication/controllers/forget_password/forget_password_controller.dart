

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repesitories/authentication/authentication_repository.dart';
import '../../../../utils/check_internet/network_manager.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configaration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...•', TImages.loadingJdon);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordRestEmail(email.text.trim());
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
    resendPasswordResetEmail(String email) async {
      try {
        // Start Loading
        TFullScreenLoader.openLoadingDialog(
            'Processing your request...•', TImages.loadingJdon);

        // Check Internet Connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          TFullScreenLoader.stopLoading();
          return;
        }

        // Send EMail to Reset Password
        await AuthenticationRepository.instance.sendPasswordRestEmail(email);
      // Remove Loader
        TFullScreenLoader.stopLoading();
        // Show Success Screen
        TLoaders.successSnackBar(title: 'Email Sent',
            message: 'Email Link Sent to Reset your Password'.tr);

        // Redirect
       // Get.to(() => ResetPasswordScreen(email: email.text.trim()));
      } catch (e) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
    }
  }
