import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constents/sizes.dart';
import '../checkout/checkout.dart';
import 'widgets/cart_items.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  TAppBar(showBackArrow: true ,title: Text('Cart', style: Theme.of (context). textTheme. headlineSmall)),
      body: const Padding(
      padding: EdgeInsets. all (TSizes.defaultSpace),
      child:  TCartItems()
                        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child: const Text('\$ 2555')),
      ),


    );
  }
}


