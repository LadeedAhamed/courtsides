import 'package:courtsides/app.dart';
import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// ------- ENTRY OF FLUTTER APP --------
void main() async {
  // Add Widgets bindings
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initializa Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
