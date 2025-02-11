import 'package:flutter/material.dart';
import 'package:tinder/features/shop/controllers/brand_controller.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/cloud_helper_function.dart';
import '../../models/brand_model.dart';
class TBrandProducts extends StatelessWidget {
  const TBrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return   Scaffold(
    appBar:  TAppBar (title: Text( brand.name)),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes .defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            TBrandCard (showBorder: true, brand:  brand),
            const SizedBox (height: TSizes.spacesBtwsections),
             FutureBuilder(
               future: controller.getBrandProducts( brandId: brand.id, ),
               builder: (context, snapshot) {
                 /// Handle Loader, No Record, OR Error Message
                 const loader = TVerticalProductShimmer();
                 final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot:snapshot, loader: loader);
                 if (widget != null) return widget;
                 // Record Found!
                 final brandProducts = snapshot .data!;

                 return TSortableProducts(products: brandProducts);
               }
             ),
          ],

        ),
      ),
    )

    );
  }
}
