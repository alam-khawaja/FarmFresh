import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:farm_your_food/global/customs/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.dart';
import '../../../../global/customs/custom_app_bar.dart';
import '../../../../global/widgets/loading_overlay.dart';
import '../../../routes/app_routes.dart';
import '../controllers/farmer_dashboard_controller.dart';

class FarmerDashboardPage extends GetView<FarmerDashboardController> {
  const FarmerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(height: Get.height, width: double.infinity),
          CustomAppBar(
            title: Get.find<UserController>().userData.userName ?? '',
            onTap: () {
              controller.logOut();
            },
          ),
          Positioned(
            top: Get.height * 0.23,
            left: 20,
            child: showDetailCard(
                title: "Create A Store",
                detail: "Start Selling Natural & Healthy Goods",
                height: Get.height * 0.23,
                width: Get.width * 0.9,
                image: Assets.store,
                onTap: () async {
                  Get.toNamed(Routes.createStore);
                }),
          ),
          Positioned(
            top: Get.height * 0.49,
            left: 20,
            child: showDetailCard(
                title: "Add Products",
                detail: "Add Products to Your Online Store",
                height: Get.height * 0.23,
                width: Get.width * 0.9,
                image: Assets.vegetables,
                onTap: () {
                  Get.toNamed(Routes.myProducts);
                }),
          ),
          Positioned(
            top: Get.height * 0.75,
            left: 20,
            child: showDetailCard(
                title: "Check Orders",
                detail: "View Your Received orders and Delivery Goods",
                height: Get.height * 0.23,
                width: Get.width * 0.9,
                image: Assets.orders,
                onTap: () {
                  // Get.toNamed(Routes.checkOrders);
                }),
          ),
          Obx(() => controller.isLoading.value
              ? const Center(child: LoadingOverlay())
              : const SizedBox()),
        ],
      )),
    );
  }
}
