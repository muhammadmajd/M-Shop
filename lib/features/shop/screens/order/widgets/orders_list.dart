import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/utils/constents/colors.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import '../../../../../utils/constents/sizes.dart';
class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
      itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox (height: TSizes .spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(

        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark?TColors.dark : TColors.light,
        child:
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 1 - Icon
                const Icon (Iconsax.ship),
                const SizedBox (width: TSizes.spaceBtwItems / 2),
            /// 2 - Status & Date


                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text (
                        'Processing',
                        style: Theme.of (context).textTheme.bodyLarge!.apply (color: TColors.primary,
                            fontWeightDelta: 1),),
                      Text ('07 Nov 2024', style: Theme.of (context). textTheme. headlineSmall),
                    ],
                  ),
                ),
                /// 3 - Icon
                IconButton(onPressed: () {}, icon: const Icon (Iconsax.arrow_right_34, size: TSizes.iconSm)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// 1 - Icon
                      const Icon (Iconsax.ship),
                      const SizedBox (width: TSizes.spaceBtwItems / 2),
                      /// 2 - Status & Date


                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text (
                              'Order',
                              style: Theme.of (context).textTheme.bodySmall!.apply (color: TColors.primary,
                                  fontWeightDelta: 1),),
                            Text ('[#3567]', style: Theme.of (context). textTheme. headlineSmall),
                          ],
                        ),
                      ),
                      /// 3 - Icon
                      //IconButton(onPressed: () {}, icon: const Icon (Iconsax.arrow_right_34, size: TSizes.iconSm)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// 1 - Icon
                      const Icon (Iconsax.ship),
                      const SizedBox (width: TSizes.spaceBtwItems / 2),
                      /// 2 - Status & Date


                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text (
                              'Order',
                              style: Theme.of (context).textTheme.bodyLarge!.apply (color: TColors.primary,
                                  fontWeightDelta: 1),),
                            Text ('[#3567]', style: Theme.of (context). textTheme. headlineSmall),
                          ],
                        ),
                      ),
                      /// 3 - Icon
                      //IconButton(onPressed: () {}, icon: const Icon (Iconsax.arrow_right_34, size: TSizes.iconSm)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
