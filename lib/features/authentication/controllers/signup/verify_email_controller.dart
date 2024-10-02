import 'dart:async';

import 'package:courtsides/common/widgets/success_screen/success_screen.dart';
import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/text_strings.dart';
import 'package:courtsides/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

// Send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerifiaction();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send EMail verification link
  void sendEmailVerifiaction() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerifiaction();
      TLoaders.successSnackBar(
          title: 'Email Send',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect(),
          ));
        }
      },
    );
  }

  // Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {}
  }
}
