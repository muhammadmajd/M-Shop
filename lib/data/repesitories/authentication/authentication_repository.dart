
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinder/utils/exceptions/firebase_exceptions.dart';

import '../../../features/authontication/screens/login/login.dart';
import '../../../features/authontication/screens/onboarding/onboarding.dart';
import '../../../features/authontication/screens/signup/verify_email.dart';
import '../../../navigation_menu.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../user/user_repository.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch (ctr +o)
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  /// Function to Show Relevant Screen
  screenRedirect() async {
    final User? user = _auth.currentUser;
    if (user != null) {
    // If the user is logged in
      if (user.emailVerified) {
    // Initialize User Specific Storage
         await TLocalStorage.init(user.uid);

         // If the user's email is verified, navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage

      if (kDebugMode) {
        print('===================== GET STORAGE  Auth=============');
        print(deviceStorage.read('IsFirstTime'));
      }
      deviceStorage.writeIfNull('IsFirstTime', true);

      deviceStorage.read('IsFirstTime') != null
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen ());
    }
  }

/*-------------------------------Email & Password sign-in---------------- */

  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email,
      String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER

  Future<UserCredential> registerWithEmailAndPassword(String email,
      String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    }
    catch (e) {
      // Handle all other exceptions
      throw Exception(
          'Something went wrong. Please try again: $e'); // Include original exception for debugging
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email,
      String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
          email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Emailverification] - MAIL VERIFICATION

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      //throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      // throw const FormatException ();
      // Handle FormatException
      throw const FormatException(
          "Invalid input format"); //Or a custom exception
    } on PlatformException catch (e) {
      throw TPlatformException(e.code)
          .message; // Consider a custom exception here too
    } catch (e) {
      // Handle all other exceptions
      throw Exception(
          'Something went wrong. Please try again: $e'); // Include original exception for debugging

    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordRestEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      //throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      // throw const FormatException ();
      // Handle FormatException
      throw const FormatException(
          "Invalid input format"); //Or a custom exception
    } on PlatformException catch (e) {
      throw TPlatformException(e.code)
          .message; // Consider a custom exception here too
    } catch (e) {
      // Handle all other exceptions
      throw Exception(
          'Something went wrong. Please try again: $e'); // Include original exception for debugging

    }
  }

/*-------------------------------Federated identity & social sign-in---------------- */

  /// (GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount
          ?.authentication;
      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      //throw 'Something went wrong. Please try again';
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///[FacebookAuthentication] - FACEBOOK
/*------------------------------- ./end Federated identity & social sign-in---------------- */

  /// [LogoutUser] - Valid for any authentication.
// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen ());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException ();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// DELETE USER - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}