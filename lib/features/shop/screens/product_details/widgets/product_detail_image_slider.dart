
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:tinder/features/shop/controllers/product/images_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_roundes_image.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
  });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final dark= THelperFunctions.isDarkMode(context);
    final images = controller.getAllProductImages(product);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors. darkerGrey : TColors. light,
        child: Stack(
          children: [
            /// Main Large Image
             SizedBox(
                height:400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller. selectedProductImage. value;
                    return GestureDetector(
                      onTap: ()=>controller.showEnlargedImage(image),
                      child: CachedNetworkImage (imageUrl: image,
                        progressIndicatorBuilder: (_,__,downloadProgress)=>
                      CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primary,)
                      ),
                    );
                    }))),
                ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,

                child: ListView.separated (
                    separatorBuilder: (_,__) => const SizedBox (width: TSizes.spaceBtwItems),
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder:(_, index)=>Obx(
                      (){
                        final imageSelected = controller. selectedProductImage. value == images [index];
                        return TRoundedImage(
                            width: 80,
                            isNetworkImage: true,
                            imageUrl:  images[index],
                            onPressed: ()=> controller.selectedProductImage.value = images[index],
                            padding: const EdgeInsets.all(TSizes.sm),
                            backgroundColor: dark ? TColors. dark : TColors.white,
                            border: Border.all (color: imageSelected ? TColors.primary : Colors .transparent),
                           );
                      }
                    )),
              ),
            ),
            /// Appbar Icon
             TAppBar(
              showBackArrow: true,
              actions: [TFavoriteIcon(productId: product.id,)],)
          ],
        ),
      ),
    );
  }
}
