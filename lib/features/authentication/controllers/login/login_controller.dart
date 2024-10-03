import 'dart:async';

import 'package:courtsides/utils/popups/loaders.dart';
import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/helpers/network_manager.dart';
import 'package:courtsides/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Varriables
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  // SIGN UP
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.dockerAnimation);

      // Check Internet COnnectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember me is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Register user in the Firebase Authentication & Save user data in the firestore
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some generic error message to user
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }
}
