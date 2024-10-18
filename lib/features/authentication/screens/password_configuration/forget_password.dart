import 'package:courtsides/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/constants/text_strings.dart';
import 'package:courtsides/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                TTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                TTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),

              // Text Fields
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),

              // Submit Buttona
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(
                      TTexts.submit,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
