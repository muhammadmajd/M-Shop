import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tinder/common/widgets/success_screen/success_screen.dart';
import 'package:tinder/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:tinder/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:tinder/navigation_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constents/image_strings.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

import 'widgets/billing_address_section.dart';
import 'widgets/billing_payment_section.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode (context) ;
    return   Scaffold(
      appBar:  TAppBar(showBackArrow: true ,title: Text('Cart', style: Theme.of (context). textTheme. headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets. all(TSizes.defaultSpace),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// - - Items in Cart
            TCartItems (showAddRemoveButtons: false),
            SizedBox(height: TSizes.spacesBtwsections),

            /// - - Coupon TextField
            TCouponCode( ),
            SizedBox (height: TSizes .spacesBtwsections),

            TRoundedContainer(
              padding: EdgeInsets. all(TSizes.md),
              showBorder: true,
              child: Column(
                children: [
                  /// Pricing
                  TBillingAmountSection(),
                SizedBox(height: TSizes.spaceBtwItems),
                  /// Divider
                     Divider (),

                  SizedBox (height: TSizes .spaceBtwItems),
                 /// payment Methods
                  TBillingPaymentSection(),
                  SizedBox (height: TSizes .spaceBtwItems),

                /// Address
                  TBillingAddressSection(),


                ],
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: ()=>Get.offAll(()=> const NavigationMenu()))), child: const Text('Checkout\$ 2555')),
      ),


    );
  }
}

