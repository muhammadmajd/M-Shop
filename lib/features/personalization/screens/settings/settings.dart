import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:tinder/common/widgets/texts/section_heading.dart';
import 'package:tinder/features/personalization/screens/profile/profile.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constents/colors.dart';
import '../../../../utils/constents/sizes.dart';
import '../../../shop/screens/order/order.dart';
import '../../../shop/screens/upload_data/upload_data.dart';
import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(child:
            Column(
              children: [
                /// appbar
                TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),), ),

                /// User Profile Card
                TUserProfileTile(onPressed: () => Get.to(const ProfileScreen()),),
                const SizedBox(height: TSizes.spacesBtwsections,),
               ],
            )
            ),
            /// -- body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: 'Account  Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile (icon: Iconsax.safe_home, title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: ( )=> Get.to(()=> const UserAddressScreen())
                  ),
                  //TOrderListItem
                  const TSettingsMenuTile (icon: Iconsax.shopping_cart, title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                   TSettingsMenuTile (icon: Iconsax.bag_tick, title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                    onTap: ( )=> Get.to(()=> const OrderScreen())
                  ),
                  const TSettingsMenuTile (icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile (icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  const TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile (icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  /// -- App Settings
                  const SizedBox (height: TSizes.spacesBtwsections),
                  const TSectionHeading (title: 'App Settings', showActionButton: false),
                  const SizedBox (height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(icon: Iconsax. document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase',
                  onTap:()=> Get.to(()=>const UploadDataScreen()),),

                    TSettingsMenuTile (
                    icon: Iconsax.location, title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                     trailing: Switch (value: true, onChanged: (value) {}),
                    ),
                  TSettingsMenuTile (
                    icon: Iconsax.location,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch (value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile (
                    icon: Iconsax.location,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                    trailing: Switch (value: true, onChanged: (value) {}),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
