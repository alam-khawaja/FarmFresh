// import 'package:farm_your_food/app/local_storage/local_storage.dart';
// import 'package:farm_your_food/global/constants/color_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../Services/product_services.dart';
// import '../models/product_model.dart';

// class ShowProductsScreenController extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool addingIntoCart = false.obs;
//   RxString productTypeImage = ''.obs;
//   RxString productType = ''.obs;
//   RxList<ProductDetailsModel> productsList = <ProductDetailsModel>[].obs;

//   RxInt productQty = 0.obs;
//   RxBool viewPredictions = false.obs;

//   getProducts() async {
//     try {
//       isLoading.value = true;
//       productsList.value =
//           await ProductServices.fetchFruitProducts(productType.value);
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = true;
//     }
//   }

//   addToCart(ProductDetailsModel model) async {
//     int price = int.parse(model.productPrice!) * productQty.value;
//     try {
//       addingIntoCart.value = true;
//       ProductModel model2 = ProductModel(
//           id: model.productId,
//           name: model.productName,
//           // : productQty.value.toString(),
//           price: model.productPrice,
//           productTotalPrice: price.toString(),
//           // farmerId: model.farmerId/,
//           buyerId: LocalStorage.getUserId(),
//           productType: model.productType);

//       await ProductServices.addToCart(model2);
//       addingIntoCart.value = false;
//       productQty = 0.obs;
//       Get.snackbar(
//         "Message",
//         "Item add successfully",
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 1),
//         backgroundColor: kBlueColor,
//         colorText: Colors.white,
//       );
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 1),
//         backgroundColor: kRedColor,
//         colorText: Colors.white,
//       );
//     }
//     addingIntoCart.value = false;
//   }

//   @override
//   void onInit() {
//     productType.value = Get.arguments[0];
//     productTypeImage.value = Get.arguments[1];
//     getProducts();
//     super.onInit();
//   }
// }
