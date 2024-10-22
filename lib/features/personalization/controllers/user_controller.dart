import 'package:courtsides/data/repositories/authentication/authentication_repo.dart';
import 'package:courtsides/data/repositories/user/user_repository.dart';
import 'package:courtsides/features/authentication/screens/login/login.dart';
import 'package:courtsides/features/personalization/models/user_model.dart';
import 'package:courtsides/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/network_manager.dart';
import 'package:courtsides/utils/popups/full_screen_loader.dart';
import 'package:courtsides/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final ImageUploading = false.obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Records from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // Refresh user record
      await fetchUserRecord();

      // Save user record
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information, You can re-save your data in your profile.');
    }
  }

  // Delete Account Warning
  Future<void> deleteAccountWarningPopup() async {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account?',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(
                color: Colors.red,
              )),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  // Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing...',
        TImages.dockerAnimation,
      );

      // First Re-authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();

          Get.to(() => const ReAuthenticateUserLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing...',
        TImages.dockerAnimation,
      );

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    }
  }

  // Upload Profile Picture
  Future<void> uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        ImageUploading.value = true;
        final url =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': url};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = url;
        user.refresh();

        TLoaders.successSnackBar(
            title: 'Congratulations!',
            message: 'Profile picture updated successfully.');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    } finally {
      ImageUploading.value = false;
    }
  }
}
