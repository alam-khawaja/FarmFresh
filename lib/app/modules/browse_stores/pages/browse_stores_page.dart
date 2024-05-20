import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/store_controller.dart';
import 'package:farm_your_food/app/models/store_model.dart';
import 'package:farm_your_food/app/modules/browse_product/controllers/browse_products_controller.dart';
import 'package:farm_your_food/app/modules/browse_stores/widgets/browse_store_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';

class BrowseStoresPage extends GetView<BrowseProductsController> {
  BrowseStoresPage({
    super.key,
  });
  final storeController = Get.put(StoreController());
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farmer Stores',
          style: AppTextStyles.loginFontsStyle.copyWith(
            color: kSecondaryColor,
            fontSize: 26,
          ),
        ),
      ),
      body: StreamBuilder<List<StoreModel>>(
        stream: storeController.stores.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No store found in your area!',
                style: AppTextStyles.normal.copyWith(
                  color: kSecondaryColor,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final filteredList = snapshot.data!;
              final StoreModel product = filteredList[index];
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

  Widget _buildProductCard(StoreModel product) {
    return BrowseStoreViewTile(
      store: product,
    );
  }
}
