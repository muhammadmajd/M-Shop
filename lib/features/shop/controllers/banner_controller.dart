import 'package:get/get.dart';

import '../../../data/repesitories/banners/banner_repository.dart';
import '../../../data/services/dummy_data.dart';
import '../../../utils/constents/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// - - Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// upload data
  void uploadBanner() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingJdon);
      await _bannerRepository.uploadDummyData(TDummyData.banners);
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