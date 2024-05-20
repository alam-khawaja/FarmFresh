import 'package:farm_your_food/app/repository/product_repository.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = RxList<ProductModel>();

  @override
  void onInit() {
    products.bindStream(ProductRepository.streamProducts());
    super.onInit();
  }

  void createProduct(ProductModel product) async {
    try {
      await ProductRepository.createProduct(product);
      products.add(product); 
    } catch (e) {
      Get.snackbar('Error', 'Failed to create product: $e');
    }
  }

  void updateProduct(String id, ProductModel updatedProduct) async {
    try {
      await ProductRepository.updateProduct( updatedProduct);
      int index = products.indexWhere((p) => p.id == id);
      if (index != -1) {
        products[index] =
            updatedProduct; // Optionally update the list if not streaming
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update product: $e');
    }
  }

  void deleteProduct(String id) async {
    try {
      await ProductRepository.deleteProduct(id);
      products.removeWhere((p) =>
          p.id == id); // Optionally remove from the list if not streaming
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product: $e');
    }
  }
}
