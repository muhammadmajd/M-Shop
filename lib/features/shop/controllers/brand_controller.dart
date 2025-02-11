
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/repesitories/brand/brand_repository.dart';
import '../../../data/repesitories/product/product_repository.dart';
import '../../../data/services/dummy_data.dart';
import '../../../utils/constents/image_strings.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/brand_model.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// - - Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show Loader while loading Brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      //isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// - - Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
     final brands = brandRepository.getBrandsForCategory(categoryId);
      return brands;

    }  catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];

    }
  }
  /// Get Brand Specific Products from your data source

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId,limit: limit);
      return products;
    }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }

  }
  /// upload data
  void uploadBrands() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingJdon);
      await brandRepository.uploadDummyData(TDummyData.brands);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'the data has been uploaded successfully');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// upload data
  void uploadBrandsCategory() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingJdon);
      await brandRepository.uploadBrandsOfCategoryDummyData(TDummyData.brandCategory);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations',
          message: 'the data has been uploaded successfully');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


}