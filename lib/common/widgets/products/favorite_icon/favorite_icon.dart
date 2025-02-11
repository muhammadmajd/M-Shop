import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/features/shop/controllers/product/favories_controller.dart';

import '../../../../utils/constents/colors.dart';
import '../../icons/t_circular_icon.dart';
class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key, required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(()=> TCircularIcon(
        icon: controller.isFavourite (productId) ? Iconsax.heart5 : Iconsax. heart,
        color: controller. isFavourite (productId) ? TColors.error : null,
      onPressed: ()=> controller.toggleFavoriteProduct(productId),
    ));
  }
}