import 'package:courtsides/common/styles/shadows.dart';
import 'package:courtsides/common/widgets/containers/rounded_container.dart';
import 'package:courtsides/common/widgets/icons/t_circular_icon.dart';
import 'package:courtsides/common/widgets/images/t_rounded_image.dart';
import 'package:courtsides/common/widgets/texts/product_price_text.dart';
import 'package:courtsides/common/widgets/texts/product_title_text.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(children: [
          TRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                const TRoundedImage(
                  imageUrl: TImages.productImage1,
                  applyImageRadius: true,
                ),

                // Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25 %',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                // Favourite Icon
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),

          // Details
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TProductTitleText(
                  title: 'Green Nike Air Shoes',
                  smallSize: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Row(
                  children: [
                    Text(
                      'Nike',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(width: TSizes.xs),
                    const Icon(
                      Iconsax.verify5,
                      color: TColors.primary,
                      size: TSizes.iconXs,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    const TProductPriceText(
                      price: '35.0',
                    ),

                    // Add to Cart Button
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius)),
                      ),
                      child: const SizedBox(
                        height: TSizes.iconLg * 1.2,
                        width: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            color: TColors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
