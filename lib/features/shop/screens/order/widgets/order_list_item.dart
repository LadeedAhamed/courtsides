import 'package:courtsides/common/widgets/containers/rounded_container.dart';
import 'package:courtsides/utils/constants/colors.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:courtsides/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemBuilder: (_, index) {
          return TRoundedContainer(
            showBorder: true,
            backgroundColor: dark ? TColors.dark : TColors.light,
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text('27 July 2024',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        ))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.ship),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text('#2255',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text('31 Jul 2024',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
