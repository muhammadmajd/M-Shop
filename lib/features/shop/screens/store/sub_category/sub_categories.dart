import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/features/shop/models/category_model.dart';
import 'package:tinder/features/shop/screens/all_products/all_products.dart';

import '../../../../../common/widgets/images/t_roundes_image.dart';
import '../../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../../../utils/helper/cloud_helper_function.dart';
import '../../../controllers/category_controller.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller= CategoryController.instance;
    return   Scaffold(
      appBar:  TAppBar(title: Text(category.name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace)
        ,
        child: Column(
          children: [
            /// Banner
            const TRoundedImage (width: double.infinity, imageUrl: TImages.promoBanner1, applyImageRadius: true,
                borderRadius: TSizes.defaultSpace, fit: BoxFit.contain,
            ),
            const SizedBox (height: TSizes.spacesBtwsections),
            /// Sub-Categories

            FutureBuilder(  
              future: controller.getSubCategories( category.id),
              builder: (context, snapshot) {
                // Handle Loader, No Record, OR Error Message
                const loader = THorizontalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;
                // Record found.
                final subCategories = snapshot .data!;

              return ListView.builder(
              shrinkWrap: true,
              itemCount: subCategories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final subCategory = subCategories[index];
                return FutureBuilder (
                    future: controller.getCategoryProducts(categoryId: subCategory.id),
                    builder: (context, snapshot) {

                      final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      // Record found.
                      final products = snapshot .data!;
                    return Column(
                      children: [
                        /// Heading
                        TSectionHeading(title: subCategory.name,
                            onPressed: ()=> Get.to(
                                ()=> AllProducts(title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                )
                            )),

                        const SizedBox (height: TSizes .spaceBtwItems / 2),

                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                              itemCount: products.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => const SizedBox (width: TSizes.spaceBtwItems),
                              itemBuilder:(context, index)=>  TProductCardHorizontal(product:  products[index])),
                        )

                      ],
                    );
                  }
                );
                  },
                  );

              }
            )

          ],
        ),),
      ),
    );
  }
}
