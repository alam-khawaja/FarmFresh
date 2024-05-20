import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/products_controller.dart';
import 'package:farm_your_food/app/modules/browse_product/controllers/browse_products_controller.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:farm_your_food/app/modules/browse_product/widgets/browse_product_view_tile.dart';
import 'package:farm_your_food/global/enums/product_categorie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';

class BrowseProductsPage extends GetView<BrowseProductsController> {
  BrowseProductsPage({
    super.key,
  }) {
    final ProductCategory? productCategory = Get.arguments as ProductCategory?;
    if (productCategory != null) {}
  }
  final ProductCategory? productCategory = Get.arguments as ProductCategory?;
  final productController = Get.put(ProductController());
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productCategory!.name,
          style: AppTextStyles.loginFontsStyle.copyWith(
            color: kSecondaryColor,
            fontSize: 26,
          ),
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
                .where((product) => product.category == productCategory!.name)
                .length,
            itemBuilder: (context, index) {
              final filteredList = snapshot.data!
                  .where((product) => product.category == productCategory!.name)
                  .toList();
              final ProductModel product = filteredList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildProductCard(product),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return BrowseProductViewTile(
      product: product,
    );
  }
}
