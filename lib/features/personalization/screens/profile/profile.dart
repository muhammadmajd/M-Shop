import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/common/widgets/images/t_circular_image.dart';
import 'package:tinder/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:tinder/utils/constents/image_strings.dart';
import 'package:tinder/utils/constents/sizes.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../controllers/user_controller.dart';
import 'widgets/profile_menu.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace /1.5,),
        child: Column(
          children:[
            /// profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx((){
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage. isNotEmpty ? networkImage : TImages.user;

                    return controller. imageUploading. value
                        ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                        : TCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage. isNotEmpty) ;
                   } ),
                  TextButton(onPressed: ()=> controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))
                ],
              ),
            ),
            /// Details
            const SizedBox (height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox (height: TSizes.spaceBtwItems),
             const TSectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () =>Get.to(()=> const ChangeName())),
            TProfileMenu(title: 'Username', value: controller.user.value.email, onPressed: () {}),
            const SizedBox (height: TSizes.spaceBtwItems),
            const Divider(),
             const SizedBox (height: TSizes.spaceBtwItems),
            const SizedBox (height: TSizes.spaceBtwItems),
            TProfileMenu (title: 'User ID', value: controller.user.value.id, onPressed: () {}),
            TProfileMenu (title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
            TProfileMenu (title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
            TProfileMenu(title:  'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu (title: 'Date of Birth', value: '04 Jun, 1987', onPressed: () {}),

          Center (
              child: TextButton (
              onPressed: () =>controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle (color: Colors.red)),))
          ]
        ),
        ),
      ),
    );
  }
}
