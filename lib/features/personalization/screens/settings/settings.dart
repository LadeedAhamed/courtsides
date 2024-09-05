import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:courtsides/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:courtsides/common/widgets/list_tile/user_profile_tile.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const TUserProfileTile(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    title: 'My Address',
                    subtitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed orders',
                    icon: Iconsax.bag_tick,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to the registered bank account',
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    title: 'Load Data',
                    subtitle: 'Upload your Data to your cloud Firebase',
                    icon: Iconsax.document_upload,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    icon: Iconsax.location,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    icon: Iconsax.security_user,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to seen',
                    icon: Iconsax.location,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
