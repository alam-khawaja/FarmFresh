import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:farm_your_food/app/local_storage/local_storage.dart';
import 'package:farm_your_food/app/modules/consumer_dashboard/controllers/consumer_dashboard_controller.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/widgets/dashboard_card.dart';
import 'package:farm_your_food/global/enums/product_categorie.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.dart';
import '../../../../global/customs/custom_app_bar.dart';
import '../../../../global/widgets/loading_overlay.dart';
import '../../../routes/app_routes.dart';

class ConsumerDashboardPage extends GetView<ConsumerDashboardController> {
  const ConsumerDashboardPage({super.key});

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
            title: Get.find<UserController>().userData.userName ?? ' ',
            onTap: () {
              controller.logOut();
            },
          ),
          Positioned(
            top: Get.height * 0.23,
            left: 20,
            child: showDetailCard(
                title: "Explore Fresh Goods",
                detail: "Buy Fruits, Seeds, Vegetables and All natural goods",
                height: Get.height * 0.23,
                width: Get.width * 0.9,
                image: Assets.cart,
                onTap: () {
                  Get.toNamed(Routes.browseStores);
                }),
          ),
          Positioned(
              top: Get.height * 0.49,
              left: 25,
              child: Text("Categories",
                  style: AppTextStyles.normal
                      .copyWith(fontSize: 15, color: kSecondaryColor))),
          Positioned(
              top: Get.height * 0.53,
              left: 27,
              child: Row(
                children: [
                  DashboardCard(
                    title: "Fruits",
                    pngImage: Assets.fruits,
                    onTap: () => {
                      Get.toNamed(
                        Routes.browseProducts,
                        arguments: ProductCategory.fruits,
                      )
                    },
                  ),
                  20.horizontalSpace,
                  DashboardCard(
                    title: "Vegetables",
                    pngImage: Assets.vegetables,
                    onTap: () => {
                      Get.toNamed(
                        Routes.browseProducts,
                        arguments: ProductCategory.vegetables,
                      )
                    },
                  )
                ],
              )),
          Positioned(
              top: Get.height * 0.75,
              left: 27,
              child: Row(
                children: [
                  DashboardCard(
                    title: "Seeds",
                    pngImage: Assets.seed,
                    onTap: () => {
                      Get.toNamed(
                        Routes.browseProducts,
                        arguments: ProductCategory.seeds,
                      )
                    },
                  ),
                  20.horizontalSpace,
                  DashboardCard(
                    title: "Wheat",
                    pngImage: Assets.wheat,
                    onTap: () => {
                      Get.toNamed(
                        Routes.browseProducts,
                        arguments: ProductCategory.wheat,
                      )
                    },
                  )
                ],
              )),
          Obx(() => controller.isLoading.value
              ? const Center(child: LoadingOverlay())
              : const SizedBox()),
        ],
      )),
    );
  }
}
