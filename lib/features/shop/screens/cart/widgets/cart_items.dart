import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price.dart';
import '../../../../../utils/constents/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
      this.showAddRemoveButtons = false,
  });

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated (
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox (height: TSizes.spacesBtwsections),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
          children: [
            const TCartItem(),

            if (showAddRemoveButtons) const  SizedBox(width: TSizes.spaceBtwItems,),
            if (showAddRemoveButtons) const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                TProductQuantityWithAddRemoveButton(),
                SizedBox(width: 70,),
                TProductPriceText(price: '256'),
              ],
            ),



          ],
        )
    );
  }
}

