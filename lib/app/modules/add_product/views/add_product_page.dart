import 'package:farm_your_food/app/models/product_model.dart';
import 'package:farm_your_food/app/modules/add_product/controllers/add_product_controller.dart';
import 'package:farm_your_food/global/enums/product_categorie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/custom_button.dart';
import 'package:farm_your_food/global/customs/custom_text_field.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:farm_your_food/global/validations/validation.dart';
import 'package:farm_your_food/global/widgets/loading_overlay.dart';

class AddProductPage extends GetView<AddProductController> {
  AddProductPage({super.key}) {
    final ProductModel? product = Get.arguments as ProductModel?;
    if (product != null) {
      controller.setProductForEdit(product);
    }
  }
  final ProductModel? product = Get.arguments as ProductModel?;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor.withOpacity(0.6),
        surfaceTintColor: kWhiteColor.withOpacity(0.2),
        leadingWidth: 24,
        title: Row(
          children: [
            Text(
              'Add Product',
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
                      controller: controller.productNameController,
                      placeHolder: "Product name",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.productPriceController,
                      placeHolder: "Product Price",
                      validator: (value) {
                        return Validations.commonValidation(
                          value,
                          length: 2,
                        );
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.discountPriceController,
                      placeHolder: "Discount Price",
                      validator: (value) {
                        return Validations.commonValidation(
                          value,
                          length: 2,
                        );
                      },
                    ),
                    SizedBox(height: Get.height * 0.023),
                    Obx(() {
                      controller.isLoading.value;
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: kSecondaryColor,
                            )),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child: ExpansionTile(
                          collapsedShape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          title: Text(
                            controller.selectedCategory.value != null
                                ? '${controller.selectedCategory.value}'
                                : 'Select Category',
                            style: AppTextStyles.normal.copyWith(
                              fontSize: 16,
                              color: kSecondaryColor,
                            ),
                          ),
                          children: ProductCategory.values.map((category) {
                            if (category == ProductCategory.none)
                              return const SizedBox();
                            return ListTile(
                              title: Text(category.name),
                              onTap: () {
                                controller.selectedCategory.value = category;
                              },
                            );
                          }).toList(),
                        ),
                      );
                    }),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.productDescriptionController,
                      placeHolder: "Product Description",
                      validator: (value) {
                        return Validations.commonValidation(value);
                      },
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CustomButton(
                        title: controller.existingProduct.value != null
                            ? 'Update Product'
                            : "Create Product",
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        color: kSecondaryColor,
                        circular: 30.0,
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();
                                await controller.createProduct();
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
            borderRadius: BorderRadius.circular(10),
            onTap: () => controller.pickImage(),
            child: Obx(
              () {
                if (controller.images.isEmpty &&
                    product != null &&
                    product!.imageUrls!.isNotEmpty) {
                  return _buildImageContainer(
                    children:
                        List.generate(product!.imageUrls!.length, (index) {
                      return _buildImageStack(
                        showRemoveIcon: false,
                        image: NetworkImage(product!.imageUrls![index]),
                        onRemove: () {
                          controller.pickImage();
                        },
                      );
                    }),
                  );
                }

                if (controller.images.isEmpty) {
                  return _buildPlaceholderImage();
                }

                return _buildImageContainer(
                  children: List.generate(controller.images.length, (index) {
                    return _buildImageStack(
                      image: FileImage(controller.images[index]),
                      onRemove: () {
                        controller.images.removeAt(index);
                      },
                    );
                  }),
                );
              },
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildImageContainer({required List<Widget> children}) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }

  Widget _buildImageStack({
    required ImageProvider image,
    required VoidCallback onRemove,
    bool showRemoveIcon = true,
  }) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        ),
        showRemoveIcon
            ? Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: onRemove,
                  child: const Icon(Icons.close, color: Colors.red),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.grey.withOpacity(0.4), size: 24),
            const SizedBox(height: 10),
            Text(
              "Upload up to 3 Images",
              style: AppTextStyles.normal.copyWith(
                fontSize: 12,
                letterSpacing: 0.1,
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
