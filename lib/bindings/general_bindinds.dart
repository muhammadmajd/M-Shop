

import 'package:get/get.dart';

import '../utils/check_internet/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
     Get.put(NetworkManager ()) ;
    }
}