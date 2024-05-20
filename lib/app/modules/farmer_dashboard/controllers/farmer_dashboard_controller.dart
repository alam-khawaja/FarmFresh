import 'dart:async';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/models/store_model.dart';
import 'package:farm_your_food/app/modules/create_store/controllers/create_store_controller.dart';
import 'package:farm_your_food/app/repository/store_repository.dart';
import 'package:get/get.dart';

import '../../../local_storage/local_storage.dart';
import '../../../routes/app_routes.dart';

class FarmerDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  final authController = Get.find<AuthController>();

 

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

 

  Future<void> fetchData() async {
    try {
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

 

  Future<void> logOut() async {
    LocalStorage.removeUserDetails();
    await authController.signOutUser();
    Get.offAllNamed(Routes.login);
  }
}
