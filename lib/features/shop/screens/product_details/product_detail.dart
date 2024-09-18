import 'package:courtsides/common/widgets/texts/read_more_text.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:courtsides/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:courtsides/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:courtsides/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:courtsides/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:courtsides/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            const TProductImageSlider(),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating & Share Button
                  const TRatingAndShare(),

                  // Price, Title, Stock & Brand
                  const TProductMetaData(),

                  // Attributes
                  const ProductAttributes(),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TReadMoreText(
                    data:
                        'Texts lets you send and receive messages from all major messaging platforms. Privacy First. Your messages never touch the Texts servers.',
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                          title: 'Reviews (199)',
                          onPressed: () => Get.to(const ProductReviewsScreen()),
                          showActionButton: false),
                      IconButton(
                          onPressed: () => Get.to(const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TBottomAddToCart(),
    );
  }
}
