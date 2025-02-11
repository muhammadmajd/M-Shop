import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constents/enums.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    return    Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
        TProductImageSlider(product: product,),
            /// 2 - Product Details
            Padding(
             padding:const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,
               top: TSizes.defaultSpace, bottom: TSizes.defaultSpace,
           ),
           child: Column(
             children: [
               /// Rating & Share Button
              const TRatingAndShare(),
               /// -- Price, Title, Stack &Brand
               TProductMetaData(product: product,),

               /// Product Attributes ,
               if (product.productType == ProductType.variable. toString() )  TProductAttributes(product: product,),
               if (product.productType == ProductType.variable.toString()) const SizedBox (height: TSizes.spacesBtwsections),

               /// -- Checkout Button
               SizedBox(width:double.infinity , child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
               const SizedBox (height: TSizes.spacesBtwsections),
               /// - Description
               const TSectionHeading (title: 'Description', showActionButton: false),
               const SizedBox(height: TSizes.spacesBtwsections),
                ReadMoreText (
                 product.description??'',
                 trimLines: 2,
                 trimMode: TrimMode.Line,
                 trimCollapsedText: ' Show more'
                 , trimExpandedText: ' Less',
                 moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                 lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
               ),

               /// - Reviews
               const Divider(),
               const SizedBox (height: TSizes.spaceBtwItems),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                   IconButton (icon: Icon (Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(()=> const ProductReviewsScreen())),
                 ],
               ),
               const SizedBox (height: TSizes.spaceBtwItems),


             ],
           ),
           )

          ],
        ),
      ),
    );
  }
}


