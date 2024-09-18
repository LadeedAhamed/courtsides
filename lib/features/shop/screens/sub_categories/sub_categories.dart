import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/common/widgets/images/t_rounded_image.dart';
import 'package:courtsides/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  fit: BoxFit.cover,
                  imageUrl: TImages.promoBanner1,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Shirts',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const TProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
