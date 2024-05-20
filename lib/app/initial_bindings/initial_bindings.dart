import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(UserController());
    // Get.put(StoreController());
    // Get.put(ProductController());
  }
}
