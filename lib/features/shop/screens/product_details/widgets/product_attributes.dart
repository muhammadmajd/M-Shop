
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/features/shop/controllers/product/variation_controller.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/texts/product_price.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/sizes.dart';
import '../../../models/product_model.dart';
import '../../product_reviews/product_reviews.dart';
class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return    Obx(
      ()=> Column(
          children: [
            /// - - Selected Attribute Pricing & Description
             // Display variation price and stock when some variation is selected.
            if (controller .selectedVariation.value.id.isNotEmpty)
              TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors. darkerGrey : TColors.grey,
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - - Title, Price and stack status
                  Row(
                    children: [
                      const TSectionHeading (title: 'Variation', showActionButton: false),
                      const SizedBox (width: TSizes .spaceBtwItems),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(title: 'Price : ' , smallSize: true),
                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice > 0)
                              Text (
                                '\$${controller.selectedVariation.value.price}',
                                style: Theme.of (context) .textTheme.titleSmall!.apply (decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox (width: TSizes.spaceBtwItems),
                              /// Sale Price
                                TProductPriceText (price: controller.getVariationPrice()),
                            ],
                          ),
                          /// stock
                          Row(
                            children: [
                              const TProductTitleText(title: 'Stock ', smallSize: true,),
                              Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),


                /// Variation Description
                    TProductTitleText(
                    title: controller.selectedVariation.value.description??'',
                    smallSize: true, maxLines: 4,
                  )
                  ///
                ],
              ),
            ),
            const SizedBox (height: TSizes.spaceBtwItems),
            /// -- Attributes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  product.productAttributes!
                  .map((attribute)=> Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       TSectionHeading (title: attribute.name??'',showActionButton: true,),
                      const SizedBox (height: TSizes.spaceBtwItems / 2),
                      Obx(
                        ()=> Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue){
                            final isSelected = controller .selectedAttributes [attribute.name] == attributeValue;
                            final available = controller
                            .getAttributesAvailabilityInVariation(product.productVariations!,attribute.name!)
                                .contains (attributeValue);
                            return TChoiceChip(text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ?(selected){
                                      if (selected && available) {
                                      controller.onAttributeSelected(product,attribute.name?? '', attributeValue);
                                      }

                              }: null/* disable*/,);
                          }
                          ).toList(),
                                        ),
                      ),


                ],
              ) ).toList()
            )
            ,




              ],
            ),
    );
      }
    }
