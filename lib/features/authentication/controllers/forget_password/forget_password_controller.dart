import 'dart:math';

import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/helpers/network_manager.dart';
import 'package:courtsides/utils/popups/full_screen_loader.dart';
import 'package:courtsides/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your request...', TImages.dockerAnimation);
      // Check Internet COnnectivity
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

      // Register user in the Firebase Authentication & Save user data in the firestore
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success SnackBar
      TLoaders.successSnackBar(
          title: 'Password Reset Email Send',
          message:
              'Please check your inbox and verify your email. If you don\'t receive an email, please check your spam folder.'
                  .tr);

      // Redirect to Reset Password Screen
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your request...', TImages.dockerAnimation);
      // Check Internet COnnectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the firestore
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success SnackBar
      TLoaders.successSnackBar(
          title: 'Password Reset Email Send',
          message:
              'Please check your inbox and verify your email. If you don\'t receive an email, please check your spam folder.'
                  .tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }
}
