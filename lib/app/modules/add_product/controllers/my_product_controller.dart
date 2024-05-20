import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:farm_your_food/app/repository/product_repository.dart';
import 'package:get/get.dart';

class MyProductController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    // print('Printed');
    // products.forEach((element) {
    //   print('${element.storeId}');
    // });
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      products.value = await ProductRepository.getProductsByStoreId(
          authController.user!.uid);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      isLoading.value = true;
      await ProductRepository.deleteProduct(productId);
      products.removeWhere((product) => product.id == productId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
