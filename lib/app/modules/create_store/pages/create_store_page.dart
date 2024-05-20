import 'package:farm_your_food/app/modules/create_store/controllers/create_store_controller.dart';
import 'package:farm_your_food/app/modules/farmer_dashboard/controllers/farmer_dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/custom_button.dart';
import 'package:farm_your_food/global/customs/custom_text_field.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:farm_your_food/global/validations/validation.dart';
import 'package:farm_your_food/global/widgets/loading_overlay.dart';
import 'package:farm_your_food/generated/assets.dart';

class CreateStorePage extends GetView<CreateStoreController> {
  const CreateStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final farmerDashboardController = Get.find<FarmerDashboardController>();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor.withOpacity(0.6),
        surfaceTintColor: kWhiteColor.withOpacity(0.2),
        leadingWidth: 24,
        title: Row(
          children: [
            Text(
              'Create a Store',
              style: AppTextStyles.loginFontsStyle.copyWith(
                color: kSecondaryColor,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    _selectImage(),
                    SizedBox(height: Get.height * 0.03),
                    CustomTextField(
                      controller: controller.storeNameController,
                      placeHolder: "Store name",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.storeTypeController,
                      placeHolder: "Store type",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.storeLocationController,
                      placeHolder: "Store location",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.streetAddressController,
                      placeHolder: "Street Address",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.storeDescriptionController,
                      placeHolder: "Store Description",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CustomButton(
                        title: controller.storeAlreadyExist.value
                            ? 'Update Current Location'
                            : "Auto Fetch Current Location",
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        color: kSecondaryColor,
                        circular: 30.0,
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                                controller.autoFetchLocation();
                              },
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CustomButton(
                        title: controller.storeAlreadyExist.value
                            ? 'Update Store'
                            : "Create Store",
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        color: kSecondaryColor,
                        circular: 30.0,
                        onPressed: controller.isLoading.value
                            ? null
                            : () async => {
                                  FocusScope.of(context).unfocus(),
                                  await controller.createOrUpdateStore(),
                                },
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(child: LoadingOverlay())
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _selectImage() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => controller.pickImage(),
            child: Obx(
              () {
                ImageProvider<Object> imageProvider;
                if (controller.image.value.path.isNotEmpty) {
                  imageProvider = FileImage(controller.image.value);
                } else if (controller.existingStore.value?.storeImage != null &&
                    controller.existingStore.value!.storeImage!.isNotEmpty) {
                  imageProvider =
                      NetworkImage(controller.existingStore.value!.storeImage!);
                } else {
                  imageProvider = const AssetImage(Assets.dashedCircle);
                }

                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.grey.withOpacity(0.4),
                      size: 24,
                    ),
                  ),
                );
              },
            ),
          ),
          10.verticalSpace,
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () => controller.pickImage(),
            child: Text(
              "Upload Image",
              textAlign: TextAlign.center,
              style: AppTextStyles.normal.copyWith(
                fontSize: 12,
                letterSpacing: 0.1,
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
