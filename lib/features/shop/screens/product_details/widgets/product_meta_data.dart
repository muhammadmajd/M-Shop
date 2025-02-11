import 'package:flutter/material.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/common/widgets/texts/product_price.dart';
import 'package:tinder/common/widgets/texts/product_title_text.dart';
import 'package:tinder/common/widgets/texts/t_brand_title_text_with_verified.dart';
import 'package:tinder/features/shop/controllers/product/product_controller.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/enums.dart';
import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../models/product_model.dart';
class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller. calculateSalePercentage (product.price, product. salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor:  TColors.secondary.withOpacity(0.8),
              padding:  const EdgeInsets.symmetric(horizontal: TSizes.sm,
                vertical: TSizes.xs
              ),
              child:  Text('$salePercentage%', style:  Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox (width: TSizes.spaceBtwItems),
            /// Price
            if(product.productType == ProductType. single.toString() && product. salePrice > 0)
             Text ('\$${product.price}', style: Theme.of (context). textTheme. titleSmall! .apply (decoration: TextDecoration. lineThrough)), const SizedBox (width: TSizes.spaceBtwItems),
            if(product.productType == ProductType. single.toString() && product. salePrice > 0)
             const SizedBox (height: TSizes.spaceBtwItems / 1.5),
            TProductPriceText (price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
    const SizedBox (height: TSizes.spaceBtwItems / 1.5),
    /// Title
     TProductTitleText(title: product.title),
     const SizedBox (height: TSizes.spaceBtwItems / 1.5),
      /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'), const SizedBox (width: TSizes .spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of (context). textTheme. titleMedium),
          ],
        ),
        const SizedBox (height: TSizes.spaceBtwItems / 1.5),
    // Brand
    Row(
    children: [
    TCircularImage(
    image: product.brand != null ? product.brand!.image:'',
      width: 32,
      height: 32,
      overlayColor: darkMode ? TColors.white : TColors.black, ), // circularImage
       TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!. name:'', brandTextSize: TextSizes .medium),
    ],
    )


      ],
    );
  }
}
