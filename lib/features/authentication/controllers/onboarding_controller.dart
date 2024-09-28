import 'package:courtsides/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index When Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // Jumb to Specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index & Jumb to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print(
            '=================== Get Storage Next Button ===================');
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);
      if (kDebugMode) {
        print(
            '=================== Get Storage Next Button ===================');
        print(storage.read('isFirstTime'));
      }
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index & Jumb to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
