
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart'; 
import 'package:tinder/common/widgets/images/t_roundes_image.dart';
import 'package:tinder/common/widgets/texts/t_brand_title_text_with_verified.dart';
import 'package:tinder/features/shop/controllers/product/product_controller.dart';
import 'package:tinder/features/shop/models/product_model.dart';
import 'package:tinder/utils/constents/image_strings.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constents/colors.dart';
import '../../../../utils/constents/enums.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../styles/shadows.dart'; 
import '../../custom_shapes/container/rounded_container.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_price.dart';
import '../../texts/product_title_text.dart';
import '../favorite_icon/favorite_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical ({
    super.key,
    required this.product
  });
  final ProductModel product;
@override
Widget build (BuildContext context) {
  final controller =ProductController.instance;
  final salePercentage= controller.calculateSalePercentage(product.price, product.salePrice);
  final dark = THelperFunctions.isDarkMode (context) ;
// Container with side paddings, color, edges, radius and shadow.
  return GestureDetector(
    onTap: ()=> Get.to(()=>  ProductDetail(product: product,)),
    child: Container( width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
    boxShadow: [
      TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.
        circular (TSizes .productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
    ),
      child: Column(
        children:[
          /// Thumbnail, Wishlist Button, Discount tag
          TRoundedContainer(
            height: 150,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark? TColors.dark :TColors.light,

            child:   Stack(
              children: [
                /// Thumbnail Image
                 Center(
                   child: TRoundedImage(
                   // height:150,
                    imageUrl: product.thumbnail, applyImageRadius: true, fit: BoxFit.cover,isNetworkImage: true,),
                 ),
                /// -- Sale Tag
                if(salePercentage != null)
                Positioned(
                  top: 7,
                  //left: 2,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                   child: Text('$salePercentage%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                /// -- Favourite Icon Button
                 Positioned(
                    top:0,
                    right:0,
                    child:  TFavoriteIcon(productId: product.id,))
              ],
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems/2,),
          /// Details
             Padding(padding: EdgeInsets.only(left: TSizes.sm),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [

              TProductTitleText(title: product.title, smallSize: true,),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              TBrandTitleWithVerifiedIcon(title: product.brand!.name),

            ],
          ),),
          const Spacer(),
          /// Price row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Price
            Flexible(
              child: Column(
                children: [
              if (product.productType == ProductType. single.toString() && product.salePrice > 0)
                  Padding (
                        padding: const EdgeInsets. only (left: TSizes.sm), child: Text (
                        product .price.toString(),
                        style: Theme.of (context). textTheme. labelMedium! .apply (decoration: TextDecoration. lineThrough),
                          ),

                          ),
                  Padding( padding:  const EdgeInsets.only(left: TSizes.sm),
                      child: TProductPriceText(
                          price:controller.getProductPrice(product) ,
                          isLarge: true),
                    ),
                ],
              ),
            ),
              Container (
                decoration: const BoxDecoration(
                  color: TColors. dark, borderRadius: BorderRadius .only (
                  topLeft: Radius .circular (TSizes .cardRadiusMd),
                  bottomRight: Radius.circular (TSizes.productImageRadius),
                ), // BorderRadius.only
                ),
                child: const SizedBox(
                    width: TSizes.iconLg *1.2,
                    height: TSizes.iconLg  * 1.2,
                    child:   Center(child: Icon (Iconsax.add, color: Colors. white,))),
              ), // Container

            ],
          )


        ]
      ),

    ),
  );
  }
}




