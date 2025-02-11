import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/features/shop/controllers/product/all_products_controller.dart';
import 'package:tinder/features/shop/models/product_model.dart';

import '../../../../utils/constents/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });
 final List <ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration ( prefixIcon: Icon (Iconsax.sort)),
          onChanged: (value){
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
          items: ['Name','Higher Price', 'Lower Price','Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem<String>(
            value: option, // Set the value for each item
            child: Text(option),
          ))
              .toList(),),
        const SizedBox(height: TSizes .spacesBtwsections),
        /// Products
        Obx( ()=> TGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) =>   TProductCardVertical(product: controller.products[index],)))
      ],
    );
  }
}
