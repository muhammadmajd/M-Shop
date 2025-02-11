
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/t_roundes_image.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../controllers/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
   // required this.banners,
  });
 // final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        // Loader
         if (controller.isLoading. value) return const TShimmerEffect(width: double.infinity, height: 190);
        // No data found
         if (controller.banners.isEmpty) {
        return const Center (child: Text ('No Data Found!'));
        }
        else{

        return   Column(
          children: [
            CarouselSlider(
                items: controller.banners
                    .map(
                        (banner) =>  TRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: ()=> Get.toNamed(banner.targetScreen),
                      borderRadius: 20, applyImageRadius: true,fit: BoxFit.cover,)).toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index)
                )
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Center(

              child: Obx(
                      ()=> Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++) TCircularContainer (width: 20, height: 4,
                        backgroundColor: controller.carousalCurrentIndex.value==i? TColors.primary : Colors.grey,
                        margin: const EdgeInsets.only(right: 10),),
                      //Text('data')
                    ],
                  )
              ),
            )


          ],
        );}
      }

    );
  }
}
