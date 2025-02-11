import 'package:get/get.dart';

class HomeController extends GetxController
{
  static HomeController get instance => Get.find();

  /// Variables
  final carousalCurrentIndex = 0.obs;
  /// Update Page Navigational Dots
  void updatePageIndicator(index)
  {
    carousalCurrentIndex.value = index;
  }
}