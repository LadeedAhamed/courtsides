import 'package:courtsides/data/repositories/categories/category_repository.dart';
import 'package:courtsides/features/shop/models/category_model.dart';
import 'package:courtsides/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading data
      isLoading.value = true;

      // Fetch Categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty).take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snaps!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load Selected Category data

  // Get Category or Sub Category Products
}
