import 'package:farm_your_food/app/modules/browse_product/controllers/browse_products_controller.dart';
import 'package:get/get.dart';

class BrowseProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BrowseProductsController());
  }
}
