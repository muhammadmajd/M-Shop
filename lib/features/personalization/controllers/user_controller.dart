

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repesitories/authentication/authentication_repository.dart';
import '../../../data/repesitories/user/user_repository.dart';
import '../../../utils/check_internet/network_manager.dart';
import '../../../utils/constents/image_strings.dart';
import '../../../utils/constents/sizes.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../authontication/models/user/user_model.dart';
import '../../authontication/screens/login/login.dart';
import '../screens/profile/widgets/re_authentication_user_login_form.dart';

class UserController extends GetxController {

  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty() .obs;
  final hidePassword = true.obs; // Observable for hiding/showing password
  final verifyEmail = TextEditingController(); // Controller for username input
  final verifyPassword = TextEditingController(); // Controller for password input
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState> () ;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

/// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      print('user::${user.fullName}');
      this.user (user);

    } catch (e) {
      user(UserModel.empty());
      }
      finally {
        profileLoading.value = false;
      }
  }
  // Save user Record from any Registration provider
  Future<void> saveUserRecord (UserCredential? userCredentials) async {
    try{
      // First Update R User and then check if user data is already stored. If not store new data
      await fetchUserRecord();
      // if no record already stored
      if(user.value.id.isEmpty){
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts = UserModel.nameParts (userCredentials .user! .displayName ?? '');
          final username = UserModel.generateUsername (userCredentials.user! .displayName ?? '');
          final user = UserModel (
            id: userCredentials.user!.uid,
            firstName: nameParts [0],
            lastName: nameParts. length > 1 ? nameParts.sublist (1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user! .phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );
          // Save user data
          await userRepository.saveUserRecord(user);


        }
      }


    } catch(e)
    {
      TLoaders .warningSnackBar ( title: 'Data not saved' ,
      message: 'Something went wrong while saving your information. You can re-save your data in your Profile.'
      );

    }


  }
  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog (
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton (
        onPressed: () async => deleteUserAccount (),
        style: ElevatedButton.styleFrom(
            backgroundColor:Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding (padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete')),
      ),
      cancel: OutlinedButton (
        child: const Text ('Cancel'),
        onPressed: () => Navigator.of(Get .overlayContext!) .pop(),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount () async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingJdon);
      // First. re-authenticate user
      final auth = AuthenticationRepository.instance;

      final provider = auth.authUser! .providerData.map((e) => e.providerId).first;
      if (provider. isNotEmpty) {
      // Re Verify Auth Email
      if (provider == 'google.com') {
      await auth.signInWithGoogle();
      await auth.deleteAccount () ;
      TFullScreenLoader.stopLoading();
      Get.offAll (() => const LoginScreen ());
      } else if (provider == 'password' ) {
        TFullScreenLoader.stopLoading();
      Get.to (() => const ReAuthLoginForm());
      }
    }
    }catch (e) {
      TFullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: 'Oh Snap!' , message: e. toString());
    }
  }

  /// - - RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {

    try{
      TFullScreenLoader.openLoadingDialog('Processing',TImages.loadingJdon);
      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected ();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen ());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// upload image
   uploadUserProfilePicture() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource. gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value =true;
        // Upload Image
       final imageUrt = await userRepository.uploadImage ('Users/Images/Profile/', image);

      // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrt};
        await userRepository.updateSingleField(json);
       user.value.profilePicture = imageUrt;
       user.refresh();
       TLoaders. successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');

      }
    }catch(e){
      TLoaders.errorSnackBar(title: 'OnSnap', message: 'Something went wrong: Se');

    } finally{
      imageUploading.value = false;
    }

    }






}