// ignore_for_file: avoid_print
import 'dart:async';

import 'package:get/get.dart';

import '../../../local_storage/local_storage.dart';
import '../../../routes/app_routes.dart';

class ConsumerDashboardController extends GetxController {
  RxBool isLoading = false.obs;

  // RxList<DataModel> dataList = <DataModel>[].obs;

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      // dataList.value = await DashboardServices.getData();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void logOut() {
    LocalStorage.removeUserDetails();
    Get.offAllNamed(Routes.login);
  }
}
