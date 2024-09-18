import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/common/widgets/brands/brand_card.dart';
import 'package:courtsides/common/widgets/layouts/grid_layout.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/features/shop/screens/brands/brand_products.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (_, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
