import 'package:courtsides/common/widgets/chips/choice_chips.dart';
import 'package:courtsides/common/widgets/containers/rounded_container.dart';
import 'package:courtsides/common/widgets/texts/product_price_text.dart';
import 'package:courtsides/common/widgets/texts/product_title_text.dart';
import 'package:courtsides/common/widgets/texts/section_heading.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          const TProductPriceText(price: '15')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const TProductTitleText(
                title:
                    'THis is the description of the product and it can go up to 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  selected: true,
                  text: 'Green',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'Yellow',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'Blue',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'White',
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  selected: true,
                  text: 'EU 32',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'EU 34',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'EU 36',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'EU 38',
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
