import 'package:courtsides/common/styles/spacing_styles.dart';
import 'package:courtsides/features/authentication/screens/login/widgets/login_form.dart';
import 'package:courtsides/common/widgets/login_signup/form_divider.dart';
import 'package:courtsides/features/authentication/screens/login/widgets/login_header.dart';
import 'package:courtsides/common/widgets/login_signup/social_buttons.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, TItle & SubTitle
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              // Divider
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
