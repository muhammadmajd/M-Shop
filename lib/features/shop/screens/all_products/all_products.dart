import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/shop/controllers/product/all_products_controller.dart';
import 'package:tinder/utils/helper/cloud_helper_function.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constents/sizes.dart';
import '../../models/product_model.dart';
class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return    Scaffold(
      appBar: TAppBar(title: Text(title),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all (TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
            // Check the state of the FutureBuilder snapshot
            const loader = TVerticalProductShimmer();
            final widget= TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
            if(widget != null) return widget;
            final products =snapshot.data!;

              return TSortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}
