import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:tinder/common/widgets/texts/section_heading.dart';
import 'package:tinder/features/shop/controllers/banner_controller.dart';
import 'package:tinder/features/shop/controllers/brand_controller.dart';
import 'package:tinder/features/shop/controllers/category_controller.dart';
import 'package:tinder/features/shop/controllers/product/product_controller.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../utils/constents/colors.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../shop/screens/order/order.dart';


class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final controllerBanner = BannerController.instance;
    final controllerProduct = ProductController.instance;
   // final controllerBrands = BrandController.instance;
    final controllerBrands = BrandController.instance;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(child:
            Column(
              children: [
                /// appbar
                TAppBar(title: Text('Upload Data',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),), ),
                const SizedBox(height: 80,)


              ],
            )
            ),
            /// -- body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: 'Main Records', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  TSettingsMenuTile(icon: Iconsax. document_upload, title: 'Upload Categories', subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: ()=>controller.uploadCategory(),),
                  
                  //TOrderListItem
                  TSettingsMenuTile (icon: Iconsax.category, title: 'Upload Brands',
                      subTitle: ' ',
                  onTap: ()=>controllerBrands.uploadBrands(),),
                  TSettingsMenuTile (icon: Iconsax.shopping_bag, title: 'Upload Products',
                      subTitle: ' ',
                      onTap: ( )=>  controllerProduct.uploadProducts()
                  ),
                  TSettingsMenuTile (icon: Iconsax.activity, title: 'Upload Banners',
                      subTitle: ' ',
                      onTap: ()=>controllerBanner.uploadBanner()),

                  /// -- App Settings
                  const SizedBox (height: TSizes.spacesBtwsections),
                  const TSectionHeading (title: 'Relationships', showActionButton: false),

                  const SizedBox (height: TSizes.spaceBtwItems),


                  TSettingsMenuTile (
                    icon: Iconsax.location, title: 'Upload Banner Categories',
                    subTitle: 'Set recommendation based on location',
                    onTap: ()=>controllerBrands.uploadBrandsCategory(),
                  ),
                  TSettingsMenuTile (
                    icon: Iconsax.location, title: 'Upload products Categories & relationaldata',
                    subTitle: 'Set recommendation based on location',
                    onTap: ()=>controllerProduct.uploadProductCategory(),
                  ),



                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
