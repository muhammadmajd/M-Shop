import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repesitories/authentication/authentication_repository.dart';
import '../../../../utils/check_internet/network_manager.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';
class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage ();
  final email = TextEditingController ();
  final password = TextEditingController ();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState> ();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    try{
      email.text = localStorage.read ('REMEMBER_ME_EMAIL');
      password. text = localStorage. read ('REMEMBER_ME_PASSWORD') ;
    } catch(e)
    {
     // TLoaders. errorSnackBar(title: 'Oh Snap', message: e.toString());
    }

    super.onInit();
  }

  /// - - Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingJdon);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected() ;
      if (!isConnected) {
            //TFullScreenLoader.stopLoading();
            return;
          }
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        return;
      }
    /// Save Data if Remember Me is selected
    if (rememberMe. value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }

      // Login user using EMail & Password Authentication

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      //TFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
      // Get.to(()=> const SignupScreen())
    } catch(e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders. errorSnackBar(title: 'Oh Snap', message: e.toString());

    }
  }


  /// - - Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('Logging you in..' , TImages.loadingJdon);

    // Check Internet Connectivity
    final isConnected = await NetworkManager. instance.isConnected();
    if (!isConnected) {
    TFullScreenLoader.stopLoading();
    return;

    }
// Google Authentication
    final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
    // Save Data
     await userController.saveUserRecord(userCredentials);

     // Remove the loader
      TFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove the loader
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }





}