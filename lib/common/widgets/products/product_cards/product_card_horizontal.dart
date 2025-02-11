import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/features/shop/models/product_model.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constents/colors.dart';
import '../../../../utils/constents/enums.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_roundes_image.dart';
import '../../texts/product_price.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified.dart';
import '../favorite_icon/favorite_icon.dart';
class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller =ProductController.instance;
    final salePercentage= controller.calculateSalePercentage(product.price, product.salePrice);

    final dark = THelperFunctions.isDarkMode (context) ;
    return Container(
        width: 310,
      padding: const EdgeInsets.all(1),
    decoration: BoxDecoration (
    //boxShadow:[TShadowStyle.verticalProductShadow],
    borderRadius: BorderRadius. circular (TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.white,
    ),
        child: Row(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all (TSizes. sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// - - Thumbnail Image
                   SizedBox(
                      height:120,
                      width: 120,
                      child: TRoundedImage (imageUrl: product.thumbnail,isNetworkImage:  true, applyImageRadius: true,
                      )),

              /// - - sale Tag
              if(salePercentage != null)
                  Positioned(
                top: 12,
                  child: TRoundedContainer ( radius: TSizes.sm,
                  backgroundColor: TColors.secondary .withOpacity (0.8),
                  padding: const EdgeInsets. symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('$salePercentage%', style: Theme.of (context). textTheme. labelLarge! .apply (color: Colors.black)),
                  ),
              ),

            /// - - Favourite Icon Button c
             Positioned (
                  top: 0,
                   right: 0,
                   child: TFavoriteIcon(productId: product.id,)
            ),
                ],
              ),
            ),
            /// Details
            SizedBox(
              width: 172,
              child: Column(
                children: [
                   Column(
                    // padding: EdgeInsets.only(top: TSizes.sm),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallSize: true),
                      SizedBox (height: TSizes.spaceBtwItems / 2),
                      SizedBox(
                          width: 60,
                          child: TBrandTitleWithVerifiedIcon(title: product.brand!.name)),
                    ],
                  ),
                  const Spacer(),
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
                      /// add to cart
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
                ],
              ),
            )

          ],
        ),
    );
  }
}
