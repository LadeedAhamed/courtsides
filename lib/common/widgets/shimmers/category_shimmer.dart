import 'package:courtsides/common/widgets/shimmers/shimmer.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.count = 6});

  final int count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: count,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              TShimmerEffect(
                width: 55,
                height: 8,
              ),

            ],
          );
        },
      ),
    );
  }
}
