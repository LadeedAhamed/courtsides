import 'package:courtsides/common/widgets/containers/rounded_container.dart';
import 'package:courtsides/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:courtsides/common/widgets/texts/read_more_text.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/image_strings.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('John', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.0),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('27 July, 2020',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const TReadMoreText(
          data:
              'Creates a fixed size box. The [width] and [height] parameters can be null to indicate that the size of the box should not be constrained in the corresponding dimension.',
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        TRoundedContainer(
          backgroundColor: dark ? TColors.dark : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Courtsides',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Nov, 2021',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                const TReadMoreText(
                    data:
                        'If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].')
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
