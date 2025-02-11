import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import '../../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/image_strings.dart';
import '../../../../../utils/constents/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar (backgroundImage: AssetImage (TImages.user)),
                const SizedBox (width: TSizes.spaceBtwItems),
                Text ('John Doe', style: Theme.of (context) .textTheme .titleLarge),
              ],
            ),
           IconButton (onPressed: () {}, icon: const Icon (Icons.more_vert)),
          ],
        ),

        Row(
          children: [
            const TRatingBarIndicator (rating: 3),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text ('01 Nov, 2023', style: Theme.of (context). textTheme .bodyMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        const ReadMoreText(
            "The user interface of the apP is quite intuitive I was able to navigate and make purchases seamlesslY. Great job, The user interface of the apP is quite intuitive I was able to navigate and make purchases seamlesslY. Great job",
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimExpandedText:" show less",
            trimCollapsedText: ' show more',
            moreStyle: TextStyle (fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary) ,
        ),
        /// Company Review

        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey: TColors. grey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text ("T's Store", style: Theme.of (context). textTheme.bodyLarge),
                      Text ('02 Nov, 2023', style: Theme.of (context) .textTheme .bodyMedium),
                ],
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              const ReadMoreText(
                "The user interface of the apP is quite intuitive I was able to navigate and make purchases seamlesslY. Great job, The user interface of the apP is quite intuitive I was able to navigate and make purchases seamlesslY. Great job",
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimExpandedText:" show less",
                trimCollapsedText: ' show more',
                moreStyle: TextStyle (fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary) ,
              ),
            ],
          ),
          ),
        )
      ],
    );
  }
}
