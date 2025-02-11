import 'package:flutter/material.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../utils/constents/sizes.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_review_card.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes .defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text ("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox (height: TSizes .spaceBtwItems),
          /// overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text ("12,611", style: Theme.of (context) .textTheme .bodySmall),
              const SizedBox(height: TSizes.spacesBtwsections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),

        ),

      ),
    );
  }
}


