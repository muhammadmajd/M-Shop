import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/shop/controllers/category_controller.dart';
import 'package:tinder/features/shop/models/category_model.dart';
import 'package:tinder/features/shop/models/product_model.dart';
import 'package:tinder/features/shop/screens/store/widgets/category_brand.dart';

import '../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/cloud_helper_function.dart';
import '../all_products/all_products.dart';
import '../brand/all_brands.dart';
class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
    final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  ListView(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
        padding: const EdgeInsets. all (TSizes.defaultSpace),
        child: Column(
            children:[
              /// -- Brands
              CategoryBrands(category: category) ,
              const SizedBox(height: TSizes.spaceBtwItems),
              /// -- Products
             FutureBuilder(
                 future: controller.getCategoryProducts (categoryId: category.id),
               builder: (context, snapshot) {
                 // Helper Function: Handle Loader, No Record, OR ERROR Message
                 final response = TCloudHelperFunctions.checkMultiRecordState(snapshot:snapshot,loader:const TVerticalProductShimmer());
                 if (response != null) return response;
                 // Record Found!
                 final products = snapshot.data!;
                 return Column(
                   children: [
                     TSectionHeading (title: 'You might like',
                         onPressed: () => Get. to(AllProducts( title: category.name,
                           futureMethod: controller. getCategoryProducts(categoryId: category.id, limit: -1),
                 ))),
                    const SizedBox(height: TSizes.spaceBtwItems),
                   TGridLayout (itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical (product: products [index])),

                     //TGridLayout(itemCount: 0, itemBuilder: (_, index) => TProductCardVertical(product:  ProductModel.empty()))

                   ],
                 );
               }
             ),
          ]),
      )],
    );
  }
}
