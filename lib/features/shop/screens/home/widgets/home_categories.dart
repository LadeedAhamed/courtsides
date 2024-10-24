import 'package:courtsides/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:courtsides/common/widgets/shimmers/category_shimmer.dart';
import 'package:courtsides/features/shop/controllers/category_controller.dart';
import 'package:courtsides/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) {
        return TCategoryShimmer(count: controller.allCategories.length);
      }
      if (controller.allCategories.isEmpty) {
        return Center(
            child: Text(
          'No Categories Found',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.allCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.allCategories[index];
            return TVerticalImageText(
              
              image: category.image,
              title: category.name,
              // ignore: prefer_const_constructors
              onTap: () => Get.to(() => SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
