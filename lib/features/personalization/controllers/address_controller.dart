
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repesitories/address/address_repository.dart';
import '../../../utils/check_internet/network_manager.dart';
import '../../../utils/constents/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
static AddressController get instance => Get.find();


  final name = TextEditingController();
  final phoneNumber = TextEditingController ();
  final street = TextEditingController ();
  final postalCode = TextEditingController();
  final city = TextEditingController ();
  final state = TextEditingController ();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState> ();
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel. empty() .obs;
  final addressRepository = Get .put(AddressRepository ());
// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses () async {
  try {
    final addresses = await addressRepository. fetchUserAddresses () ;
    selectedAddress.value = addresses. firstWhere( (element) => element. selectedAddress, orElse: () => AddressModel.empty());
    return addresses;
  } catch (e)
    {
      TLoaders.errorSnackBar(title: 'Address not found', message: e. toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
    // Clear the "selected" field
    if(selectedAddress .value.id.isNotEmpty){
    await addressRepository.updateSelectedField(selectedAddress.value.id, false);
    }
    // Assign selected address
    newSelectedAddress.selectedAddress = true;
    selectedAddress.value = newSelectedAddress;
    //  Set the "selected" field to true for the newly selected address
    await addressRepository.updateSelectedField(selectedAddress.value.id,true);
    } catch (e)
    {
      TLoaders. errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add new Address
  Future addNewAddresses() async {
    try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('Storing Address...', TImages.successJson);
    // Check Internet Connectivity
    final isConnected = await NetworkManager .instance .isConnected();
    if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
        }
      // Form Validation
    if (!addressFormKey.currentState! .validate()) {
      TFullScreenLoader.stopLoading(); return;
    }
// Save Address Data
    final address= AddressModel(
        id:'',
        name: name.text.trim(),
        phoneNumber: phoneNumber. text. trim(),
        street: street. text. trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode. text. trim(),
        country: country.text. trim(),
        selectedAddress: true,
    );
      final id = await addressRepository.addAddress(address) ;
      // Update Selected Address status
      address.id = id;
      await selectAddress (address);

      // Remove Loader
      TFullScreenLoader.stopLoading();
// Show Success Message
      TLoaders. successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully.');
          // Refresh Addresses Data
      refreshData.toggle();
    // Reset fields
        resetFormFields();
    // Redirect
    Navigator.of(Get.context!).pop();

    } catch (e)
    {
    //Remove Loader
    TFullScreenLoader.stopLoading();
    TLoaders. errorSnackBar (title: 'Address not found', message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields() {
    name. clear ();
    phoneNumber .clear();
    street.clear();
    postalCode .clear ();
    city.clear ();
    state .clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

}