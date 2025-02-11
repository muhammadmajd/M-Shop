import 'package:flutter/material.dart';
import 'package:tinder/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constents/sizes.dart';
class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded (child: TShimmerEffect (width: 150, height: 110)),
            SizedBox (width: TSizes .spaceBtwItems),
            Expanded (child: TShimmerEffect (width: 150, height: 110)),
            SizedBox (width: TSizes.spaceBtwItems),
            Expanded (child: TShimmerEffect (width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
