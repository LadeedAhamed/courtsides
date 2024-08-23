import 'package:courtsides/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:courtsides/common/widgets/layouts/grid_layout.dart';
import 'package:courtsides/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:courtsides/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:courtsides/features/shop/screens/home/widgets/home_categories.dart';
import 'package:courtsides/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
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
              ),
            ),

            // Body
            const Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: TPromoSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                  ],
                )),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Popular Products
            TGridLayout(
              itemCount: 6,
              itemBuilder: (p0, p1) => const TProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
