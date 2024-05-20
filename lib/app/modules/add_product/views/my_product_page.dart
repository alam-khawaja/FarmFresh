import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/products_controller.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:farm_your_food/app/modules/add_product/controllers/my_product_controller.dart';
import 'package:farm_your_food/app/modules/add_product/widgets/product_tile.dart';
import 'package:farm_your_food/app/routes/app_routes.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductPage extends GetView<MyProductController> {
  const MyProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor.withOpacity(0.6),
        surfaceTintColor: kWhiteColor.withOpacity(0.2),
        leadingWidth: 24,
        title: Row(
          children: [
            Text(
              'My Products',
              style: AppTextStyles.loginFontsStyle.copyWith(
                color: kSecondaryColor,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: productController.products.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No products found. Add your first product!',
                style: AppTextStyles.normal.copyWith(
                  color: kSecondaryColor,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!
                .where((product) => product.storeId == authController.user!.uid)
                .length,
            itemBuilder: (context, index) {
              final filteredList = snapshot.data!
                  .where(
                      (product) => product.storeId == authController.user!.uid)
                  .toList();
              final ProductModel product = filteredList[index];
              return ProductTile(
                product: product,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kWhiteColor,
        onPressed: () {
          Get.toNamed(Routes.addProducts);
        },
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
