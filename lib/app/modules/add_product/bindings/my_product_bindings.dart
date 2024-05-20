import 'package:farm_your_food/app/modules/add_product/controllers/my_product_controller.dart';
import 'package:get/get.dart';

class MyProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyProductController());
  }
}
