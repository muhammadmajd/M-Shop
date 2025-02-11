import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/utils/device/device_utality.dart';
import 'package:tinder/utils/helper/helper_functions.dart';

import '../../../utils/constents/sizes.dart';
class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow =true,
  
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow?IconButton(onPressed: ()=>Get.back(), icon:  Icon(Iconsax.arrow_left,color: dark?Colors.white: Colors.black,))
      :leadingIcon !=null?
      IconButton(onPressed: leadingOnPressed, icon:  Icon(leadingIcon)):null,
      title: title,
      actions: actions,
    ),);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getappbarheight());
 // Size get preferredSize => Size.fromHeight(TDeviceUtils.getappbarheight());
}
