
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constents/colors.dart';
import '../../../../../utils/constents/text_strings.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(UserController());
    return TAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text("data",style: TextStyle(color: Colors.black,fontSize:30),),
        Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color:TColors.grey),),
        Obx(() {
          if (controller .profileLoading .value) {
            // Display a shimmer loader while user profile is being 1
            return const TShimmerEffect(width: 80, height: 15);
          } else {
          return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color:TColors.white),);
          }
        })
      ],
    ),
        actions: [
          TCartCounterIcon(onPressed: () {  }, iconColor: TColors.white,),


        ]

    );
  }
}
