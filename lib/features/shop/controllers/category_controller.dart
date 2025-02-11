

import 'package:get/get.dart';

import '../../../data/repesitories/categories/category_repository.dart';
import '../../../data/repesitories/product/product_repository.dart';
import '../../../data/services/dummy_data.dart';
import '../../../utils/constents/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final
  _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
  /// - - Get category data
  Future<void> fetchCategories () async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
       final categories = await _categoryRepository.getAllCategories();
      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category)=>category.isFeatured && category.parentId.isEmpty).take(8).toList());
      //featuredCategories.assignAll(allCategories.where((category)=>category.isFeatured && category.parentId=='null').take(8).toList());


    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    } finally{
      isLoading.value = false;

    }
  }

  /// Get Category or Sub-Category Products.
  Future<List<ProductModel>> getCategoryProducts ({required String categoryId, int limit = 4}) async {

    try{
    // Fetch limited (4) products against each subCategory;
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
  }
  }

  /// Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
        return subCategories;
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
    }
  }


  /// upload data
  void uploadCategory() async {
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingJdon);
      await _categoryRepository.uploadDummyData(TDummyData.categories);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar (title: 'Congratulations', message: 'the data has been uploaded successfully');

    } catch(e){
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar (title: 'Oh Snap!', message: e.toString());

    }


  }
}