import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/common/widgets/icons/t_circular_icon.dart';
import 'package:tinder/common/widgets/layouts/grid_layout.dart';
import 'package:tinder/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:tinder/features/shop/controllers/product/favories_controller.dart';
import 'package:tinder/features/shop/screens/home/home.dart';
import 'package:tinder/utils/helper/cloud_helper_function.dart';

import '../../../../common/widgets/loader/animation_loader.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/constents/sizes.dart';
import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =FavouritesController.instance;
    return   Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add,onPressed: ()=>Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace ),
          child:  Column(
            children: [
              Obx(
                ()=> FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    /// Nothing Found Widget
                    final emptyWidget = TAnimationLoaderWidget (
                        text: 'Whoops! Wishlist is Empty...',
                        animation: TImages.loadingJdon,
                      showAction: true,
                        actionText: 'Let\'s add some',

                        onActionPressed: () => Get.off (() => const NavigationMenu()),
                    );

                    const loader = TVerticalProductShimmer (itemCount: 6);
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot:snapshot, loader: loader, nothingFound: emptyWidget);
                    if (widget != null) return widget;
                    final products = snapshot. data!;
                    return TGridLayout (itemCount: products. length, itemBuilder: (_, index) => TProductCardVertical(product: products [index]));
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
