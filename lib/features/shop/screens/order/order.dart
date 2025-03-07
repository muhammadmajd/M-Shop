import 'package:flutter/material.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/utils/constents/sizes.dart';

import 'widgets/orders_list.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// - - AppBar
      appBar: TAppBar (title: Text ('My Orders', style: Theme.of (context) .textTheme .headlineSmall),
        showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItem(),
          ),
    );
  }
}
