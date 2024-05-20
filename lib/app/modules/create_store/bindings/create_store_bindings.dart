import 'package:farm_your_food/app/modules/create_store/controllers/create_store_controller.dart';
import 'package:get/get.dart';

class CreateStoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateStoreController());
  }
}
