import 'package:courtsides/features/authentication/controllers/signup/signup_controller.dart';
import 'package:courtsides/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/constants/text_strings.dart';
import 'package:courtsides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Username
          TextFormField(
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user),
            ),
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Email
          TextFormField(
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) => TValidator.validateEmail(value),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Phone number
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: (value) => TValidator.validatePhoneNumber(value),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                ),
              ),
              validator: (value) => TValidator.validatePassword(value),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // Terms & Condition CheckBox
          const TTermsAndConditionsCheck(),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
