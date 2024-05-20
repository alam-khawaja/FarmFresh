import 'package:farm_your_food/app/modules/add_product/controllers/add_product_controller.dart';
import 'package:get/get.dart';

class AddProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProductController());
  }
}
