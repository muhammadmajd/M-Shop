import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repesitories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

void main() async{
  /// Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///  Init Local Storage
  await GetStorage.init();
  /// Await Splash until other items Load
  FlutterNativeSplash.preserve (widgetsBinding: widgetsBinding);

   /// - Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value)=>Get.put(AuthenticationRepository()),// to check authentication status
  );
// Todo: Initialize Authentication
  runApp(const App());
}
