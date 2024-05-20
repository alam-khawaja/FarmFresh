import 'package:farm_your_food/app/modules/consumer_dashboard/controllers/consumer_dashboard_controller.dart';
import 'package:get/get.dart';

class ConsumerDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ConsumerDashboardController());
  }
}
