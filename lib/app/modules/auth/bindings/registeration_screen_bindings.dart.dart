import 'package:farm_your_food/app/modules/auth/controllers/registration_screen_controller.dart';
import 'package:get/get.dart';

class RegistrationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationScreenController());
  }
}
