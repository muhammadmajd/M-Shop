import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/shop/controllers/product/product_controller.dart';
import 'package:tinder/features/shop/screens/home/widgets/promo_slider.dart';

import 'package:tinder/utils/constents/sizes.dart';




import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';

import '../all_products/all_products.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return     Scaffold(
     // appBar: Pre,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child:  Column(
                children: [

                  ///-- .  Appbar --
                  const THomeAppBar(),
                  const SizedBox(width: TSizes.spacesBtwsections,),


                  /// -- Searchbar --
                  const TSearchContainer(   text: 'Search in Store',),
                  const SizedBox(width: TSizes.spacesBtwsections,),
                  //const SizedBox(width: TSizes.spacesBtwsections,),
                  /// - - Categories --
                  Padding(padding: const EdgeInsets.only(left: TSizes.defaultSpace,top: TSizes.defaultSpace),
                  child: Column(
                    children: [

                      const SizedBox(width: TSizes.spaceBtwItems,),
                      Container(
                       padding:   const EdgeInsets.only(top: TSizes.spaceBtwItems),
                          child:  const TSectionHeading(title: 'Popular Categories' ,
                            showActionButton: false, textColor: Colors.white,
                            )),
                      /// Categories
                      Container(
                          padding: const EdgeInsets.only(top: TSizes.spaceBtwItems),
                          child: const THomeCategories())

                    ]

                  ),),
                  const SizedBox(height: TSizes.spacesBtwsections,)
                ],
              )
            ),

           /// Body -- tutorial
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child:
              Column(
                children: [
                  const TPromoSlider(),
                 /* const TPromoSlider(banners:  [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],),*/
                   const SizedBox(width: TSizes.spacesBtwsections,),
                  /// -- Heading

                   TSectionHeading(title: 'Popular Products', onPressed: ()=>Get.to(
                           ()=>  AllProducts(
                             title: 'Popular Products',
                             //query: FirebaseFirestore.instance.collection('Products').where ('IsFeatured', isEqualTo: true).limit (6),
                             futureMethod: controller.fetchAllFeaturedProducts(),
                         )),
                   ),
                  const SizedBox(width: TSizes.spacesBtwsections,),

                  /// -- Categories --
                   Obx((){
                    if (controller. isLoading. value) return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium));
                    }
                     return TGridLayout (
                       itemCount: controller.featuredProducts.length,
                       itemBuilder:(_, index)=>  TProductCardVertical(product:  controller.featuredProducts[index]),
                       );
                   }),

// GridView.builder
                 // const TProductCardVertical()
                ],
              ),
            )


          ],
        ),
      )
    );
  }
}





