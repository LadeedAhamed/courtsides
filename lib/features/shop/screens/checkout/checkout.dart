import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/common/widgets/containers/rounded_container.dart';
import 'package:courtsides/common/widgets/success_screen/success_screen.dart';
import 'package:courtsides/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:courtsides/common/widgets/products/cart/coupon_code.dart';
import 'package:courtsides/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:courtsides/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:courtsides/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:courtsides/navigation_menu.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  onPressed: () => Get.offAll(const NavigationMenu()),
                  subTitle: 'Your item will be shipped soon.',
                  title: 'Payment Success!',
                )),
            child: const Text('Checkout \$200.0')),
      ),
    );
  }
}
