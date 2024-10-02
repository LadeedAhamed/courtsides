import 'package:courtsides/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/device/device_utility.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingCircularButton extends StatelessWidget {
  const OnBoardingCircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? TColors.primary : TColors.dark),
          onPressed: () => OnboardingController.instance.nextPage(),
          child: const Icon(Iconsax.arrow_right_3)),
    );
  }
}
