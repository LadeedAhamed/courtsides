import 'dart:async';

import 'package:courtsides/utils/popups/loaders.dart';
import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/data/repositories/user/user_repository.dart';
import 'package:courtsides/features/authentication/screens/signup/verify_email.dart';
import 'package:courtsides/features/personalization/models/user_model.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/helpers/network_manager.dart';
import 'package:courtsides/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Varriables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  // SIGN UP
  Future<void> signUp() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.dockerAnimation);

      // Check Internet COnnectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privancy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: 'Congratualtions',
          message: 'Your account has been created! Verify email to continue.');

      // Move to verify email address
      Get.to(VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some generic error message to user
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }
}
