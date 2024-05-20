import 'package:farm_your_food/app/modules/browse_stores/controllers/browse_stores_controller.dart';
import 'package:get/get.dart';

class BrowseStoresBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BrowseStoresController());
  }
}
