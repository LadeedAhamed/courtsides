import 'package:courtsides/data/repositories/user/user_repository.dart';
import 'package:courtsides/features/personalization/controllers/user_controller.dart';
import 'package:courtsides/features/personalization/screens/profile/profile.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/helpers/network_manager.dart';
import 'package:courtsides/utils/popups/full_screen_loader.dart';
import 'package:courtsides/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateuserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialaizeNames();
    super.onInit();
  }

  void initialaizeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are updating your profile...', TImages.dockerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateuserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update User's First Name & Last Name
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the RxUser value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Your name has been updated successfully.',
      );

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }
}
