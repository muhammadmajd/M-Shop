import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tinder/common/widgets/appbar/appbar.dart';
import 'package:tinder/features/personalization/controllers/address_controller.dart';
import 'package:tinder/utils/constents/colors.dart';
import 'package:tinder/utils/constents/sizes.dart';

import '../../../../utils/helper/cloud_helper_function.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';


class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.primary,
          onPressed: ()=>Get.to(()=> const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color:  TColors.white,),

      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body:  SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
          ()=> FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
            builder: (context, snapshot) {
              /// Helper Function: Handle Loader, No Record, OR ERROR Message
              final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if (response != null) return response;
              final addresses = snapshot.data!;
              return ListView.builder (
                  shrinkWrap: true,
                  itemCount: addresses.length,
                itemBuilder: (_,index)=>TSingleAddress(address: addresses [index],
                  onTap: () => controller.selectAddress (addresses [index]),));
                }


          ),
        ),),

      ),
    );
  }
}
