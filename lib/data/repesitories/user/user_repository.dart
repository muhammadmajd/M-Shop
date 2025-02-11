
// Repository class for user-related operations.
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/authontication/models/user/user_model.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

import '../authentication/authentication_repository.dart';

// Repository class for user-related operations.
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to Firestore.
  Future<void> saveUserRecord (UserModel user) async {
    try {
      if(kDebugMode){
        print('==============newUser=====================');
        print(user);
        print(user.fullName);
        print(user.id);
      }
      //await _db.collection("Users").doc(user.id).set(user.toJson()).onError((e, _) => print("Error writing document: $e"));

      await _db.collection("Users").doc(user.id).set(user.toJson()).onError((e, _) => print("Error writing document: $e"));
      } on FirebaseException catch (e) {
        throw TFirebaseException (e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails ( ) async {
    try {
      final documentSnapshot = await _db.collection ("Users") .doc (AuthenticationRepository.instance.authUser?.uid) .get ();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/// Function to update user data in Firestore.
  Future<void> updateUserDetails ( UserModel updatedUser) async {
    try {
      await _db.collection ("Users").doc (updatedUser.id) .update(updatedUser. toJson ()) ;
    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
/// Update any field in specific Users Collection
  Future<void> updateSingleField (Map<String, dynamic> json) async {
    try {
      await _db.collection("Users"). doc (AuthenticationRepository.instance.authUser?.uid).update (json);
    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /// Remove user data
  Future<void> removeUserRecord ( String  userId) async {
    try {
      await _db.collection ("Users") .doc(userId).delete ();
    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// ipload image
  Future<String> uploadImage( String  path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

      return url;

    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException (e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}