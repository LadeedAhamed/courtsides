import 'package:courtsides/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:courtsides/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:courtsides/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:courtsides/features/shop/screens/home/widgets/home_categories.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                // AppBar
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                // SeaarchBar
                TSearchContainer(text: 'Search in Store'),
                SizedBox(height: TSizes.spaceBtwSections),

                // Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      THomeCategories(),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
