// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:farm_your_food/app/controllers/auth_controller.dart';
// import 'package:farm_your_food/app/models/product_model.dart';
// import 'package:farm_your_food/app/repository/product_repository.dart';
// import 'package:farm_your_food/global/enums/product_categorie.dart';
// import 'package:farm_your_food/global/utils/app_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class AddProductController extends GetxController {
//   final AuthController authController = Get.find<AuthController>();
//   final formKey = GlobalKey<FormState>();

//   TextEditingController productNameController = TextEditingController();
//   TextEditingController productPriceController = TextEditingController();
//   TextEditingController discountPriceController = TextEditingController();
//   TextEditingController productCategoryController = TextEditingController();
//   TextEditingController productDescriptionController = TextEditingController();

//   RxList<File> images = <File>[].obs;
//   RxBool isLoading = false.obs;
//   Rx<ProductModel?> existingProduct = Rx<ProductModel?>(null);
//   Rx<ProductCategory?> selectedCategory = Rx<ProductCategory?>(null);

//   @override
//   void dispose() {
//     productCategoryController.dispose();
//     productPriceController.dispose();
//     discountPriceController.dispose();
//     productCategoryController.dispose();
//     productDescriptionController.dispose();
//     selectedCategory.value = null;
//     super.dispose();
//   }

//   void clearForm() {
//     existingProduct.value = null;
//     productNameController.clear();
//     productPriceController.clear();
//     discountPriceController.clear();
//     productDescriptionController.clear();
//     images.clear();
//     selectedCategory.value = null;
//   }

//   void pickImage() async {
//     final ImagePicker picker = ImagePicker();

//     if (images.length >= 3) {
//       Get.snackbar('Limit Reached', 'You can only upload up to 3 images.');
//       return;
//     }

//     final List<XFile> pickedFiles = await picker.pickMultiImage();
//     if (pickedFiles.isNotEmpty) {
//       if (pickedFiles.length + images.length > 3) {
//         Get.snackbar('Limit Exceeded', 'You can only upload up to 3 images.');
//       } else {
//         for (XFile file in pickedFiles) {
//           images.add(File(file.path));
//         }
//       }
//     }
//   }

//   Future<void> createOrUpdateProduct() async {
//     if (selectedCategory.value == null) {
//        AppDialog.showErrorDialog(message: 'Seems you forgot to select categories! ',title: 'Oops');
//     }
//     if (formKey.currentState!.validate()) {
//       try {
//         isLoading.value = true;
//         ProductModel? existingProduct =
//             await ProductRepository.getProductByUserId(
//                 authController.user!.uid);
//         if (existingProduct != null) {
//           await _updateProduct(existingProduct);
//            AppDialog.showErrorDialog(message: 'Product updated Successfully! ',title: 'Success');
//         } else {
//           await _createProduct();
//            AppDialog.showErrorDialog(message: 'Product created Successfully! ',title: 'Success');
//         }
//       } catch (e) {
//         isLoading.value = false;
//         AppDialog.showErrorDialog(message: 'Failed to create/update product: $e',title: 'Error');

//       }
//     }
//   }

//   Future<void> _createProduct() async {
//     List<String> imageUrls = [];
//     for (File image in images) {
//       String imageUrl = await ProductRepository.uploadImage(image);
//       imageUrls.add(imageUrl);
//     }

//     ProductModel product = ProductModel(
//       storeId: authController.user!.uid,
//       name: productNameController.text,
//       price: double.parse(productPriceController.text),
//       discountPrice: double.parse(discountPriceController.text),
//       category: selectedCategory.value,
//       description: productDescriptionController.text,
//       imageUrls: imageUrls,
//       // createdAt: Timestamp.now(),
//     );

//     DocumentReference productRef =
//         await ProductRepository.createProduct(product);

//     await productRef.update({'id': productRef.id});

//     isLoading.value = false;
//     Get.snackbar('Success', 'Product created successfully');
//     Get.back();
//   }

//   Future<void> _updateProduct(ProductModel existingProduct) async {
//     List<String> imageUrls = existingProduct.imageUrls ?? [];
//     if (images.isNotEmpty) {
//       imageUrls.clear();
//       for (File image in images) {
//         String imageUrl = await ProductRepository.uploadImage(image);
//         imageUrls.add(imageUrl);
//       }
//     }

//     ProductModel updatedProduct = existingProduct.copyWith(
//       name: productNameController.text,
//       price: double.parse(productPriceController.text),
//       discountPrice: double.parse(discountPriceController.text),
//       category: selectedCategory.value,
//       description: productDescriptionController.text,
//       imageUrls: imageUrls,
//     );

//     await ProductRepository.updateProduct(updatedProduct);
//     isLoading.value = false;
//     Get.snackbar('Success', 'Product updated successfully');
//     Get.back();
//   }

//   Future<void> deleteProduct(String productId) async {
//     try {
//       isLoading.value = true;
//       await ProductRepository.deleteProduct(productId);
//       isLoading.value = false;
//       Get.snackbar('Success', 'Product deleted successfully');
//     } catch (e) {
//       isLoading.value = false;
//       Get.snackbar('Error', 'Failed to delete product: $e');
//     }
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:farm_your_food/app/repository/product_repository.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/global/enums/product_categorie.dart';
import 'package:farm_your_food/global/utils/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  RxList<File> images = <File>[].obs;
  RxList<String> imageUrls = <String>[].obs;
  RxBool isLoading = false.obs;
  Rx<ProductModel?> existingProduct = Rx<ProductModel?>(null);
  Rx<ProductCategory?> selectedCategory = Rx<ProductCategory?>(null);

  Stream<List<ProductModel>> get productsStream =>
      ProductRepository.streamProducts();

  void setProductForEdit(ProductModel product) {
    existingProduct.value = product;
    productNameController.text = product.name ?? '';
    productPriceController.text = product.price?.toString() ?? '';
    discountPriceController.text = product.discountPrice?.toString() ?? '';
    productDescriptionController.text = product.description ?? '';
    selectedCategory.value = ProductCategory.fromString(product.category!);
    imageUrls.value = product.imageUrls ?? [];
    images.clear();
  }

  @override
  void dispose() {
    existingProduct.value = null;
    productNameController.dispose();
    productPriceController.dispose();
    discountPriceController.dispose();
    productDescriptionController.dispose();
    images.clear();
    selectedCategory.value = null;
    images.clear();
    imageUrls.clear();
    selectedCategory.value = null;
    super.dispose();
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.length <= 3) {
      images.value = pickedFiles.map((file) => File(file.path)).toList();
    }
  }

  Future<void> createProduct() async {
    if (formKey.currentState!.validate()) {
      if (selectedCategory.value == null) {
        Get.snackbar('Oops', 'Seems you forgot to select categories! ');
      }
      if (selectedCategory.value != null) {
        try {
          isLoading.value = true;
          List<String> imageUrls = [];
          if (images.isNotEmpty) {
            for (var image in images) {
              String imageUrl = await ProductRepository.uploadImage(image);
              imageUrls.add(imageUrl);
            }
          }

          ProductModel product = ProductModel(
            storeId: authController.user!.uid,
            name: productNameController.text,
            category: selectedCategory.value!.name,
            price: double.tryParse(productPriceController.text),
            discountPrice: double.tryParse(discountPriceController.text),
            description: productDescriptionController.text,
            imageUrls: imageUrls,
          );

          DocumentReference productRef =
              await ProductRepository.createProduct(product);
          await productRef.update({'id': productRef.id});
          Get.back();
          isLoading.value = false;

          Future.delayed(Duration(milliseconds: 100), () {
            AppDialog.showErrorDialog(
                message: 'Product created Successfully! ', title: 'Success');
          });
        } catch (e) {
          isLoading.value = false;
          Get.back();
          AppDialog.showErrorDialog(
              message: 'Failed to create product: $e', title: 'Error');
        }
      }
    }
  }

  Future<void> updateProduct() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        List<String> imageUrls = [];
        if (images.isNotEmpty) {
          for (var image in images) {
            String imageUrl = await ProductRepository.uploadImage(image);
            imageUrls.add(imageUrl);
          }
        }

        ProductModel updatedProduct = ProductModel().copyWith(
          name: productNameController.text,
          category: selectedCategory.value!.name,
          price: double.tryParse(productPriceController.text),
          discountPrice: double.tryParse(discountPriceController.text),
          description: productDescriptionController.text,
          imageUrls: imageUrls.isNotEmpty
              ? imageUrls
              : existingProduct.value!.imageUrls,
        );

        await ProductRepository.updateProduct(updatedProduct);

        isLoading.value = false;
        AppDialog.showErrorDialog(
            message: 'Product updated Successfully! ', title: 'Success');
        Get.back();
      } catch (e) {
        isLoading.value = false;
        AppDialog.showErrorDialog(
            message: 'Failed to update product: $e', title: 'Error');
      }
    }
  }
}
