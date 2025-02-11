import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/device/device_utality.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark =THelperFunctions.isDarkMode(context);

    return Positioned(bottom:TDeviceUtils.getBottomNavigationBarHeight()+25,
        left: TSizes.defaultSpace,

        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect:ExpandingDotsEffect(
              activeDotColor: dark ? TColors.dark:TColors.light,
              dotHeight: 6),));
  }
}
