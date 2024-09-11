import 'package:courtsides/common/widgets/appbar/appbar.dart';
import 'package:courtsides/features/shop/screens/product_reviews/widgets/overall_product_indicator.dart';
import 'package:courtsides/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:courtsides/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, and those that follow, will not be rendered. Otherwise, it will be shown with the given overflow option."),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text(
                '6,111',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
