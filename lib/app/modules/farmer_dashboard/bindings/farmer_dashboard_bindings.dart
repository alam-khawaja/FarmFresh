import 'package:farm_your_food/app/modules/farmer_dashboard/controllers/farmer_dashboard_controller.dart';
import 'package:get/get.dart';

class FarmerDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FarmerDashboardController());
  }
}
