
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/authontication/controllers/onboarding/onboarding_controller.dart';
import 'package:tinder/features/authontication/screens/onboarding/widgets/onBoarding_page.dart';
import 'package:tinder/features/authontication/screens/onboarding/widgets/onBoarding_skip.dart';
import 'package:tinder/features/authontication/screens/onboarding/widgets/onboarding_dot_navigation.dart';

import 'package:tinder/features/authontication/screens/onboarding/widgets/onboarding_next_button.dart';

import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());
    return  Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator ,
            children:const [
              OnBoardingPage(image:TImages.onBoardingImage1,
                  title:TTexts.onBoardingSubTitle1,
                  subTitle:  TTexts.onBoardingTitle1),
              OnBoardingPage(image:TImages.onBoardingImage2,
                  title:TTexts.onBoardingSubTitle2,
                  subTitle:  TTexts.onBoardingTitle2),
              OnBoardingPage(image:TImages.onBoardingImage3,
                  title:TTexts.onBoardingSubTitle3,
                  subTitle:  TTexts.onBoardingTitle3),
            ],
          ),
          /// Skip Button
         const OnBoardingSkip(),
          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          /// Circular Button
          const OnBoardingNextButton()
        ],
      ), //
    );

  }
}
