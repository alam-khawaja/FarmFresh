import 'package:farm_your_food/app/modules/auth/controllers/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginScreenController());
  }
}
