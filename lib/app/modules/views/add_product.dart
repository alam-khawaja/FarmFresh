
// import 'package:farm_your_food/app/modules/add_product/controllers/add_product_controller.dart';
// import 'package:farm_your_food/generated/assets.dart';
// import 'package:farm_your_food/global/constants/color_constants.dart';
// import 'package:farm_your_food/global/utils/app_text_styles.dart';
// import 'package:farm_your_food/global/utils/widget_spacing.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddProducts extends GetView<AddProductController> {
//   const AddProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Form(
//                 key: controller.formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: Get.height * 0.1),
//                     Text("Add Products Store",
//                         style: AppTextStyles.loginFontsStyle
//                             .copyWith(color: kSecondaryColor)),

//                     SizedBox(height: Get.height * 0.03),
//                     20.verticalSpace,
//                     CustomTextField(
//                       controller: controller.productName,
//                       placeHolder: "Product name",
//                       validator: (value) {
//                         value = Validations.commonValidation(value);
//                         return value;
//                       },
//                       prefix: Image.asset(Assets.vegetables,
//                           color: kSecondaryColor),
//                     ),
//                     SizedBox(height: Get.height * 0.023),
//                     // CustomTextField(
//                     //   controller: controller.productType,
//                     //   validator: (value) {
//                     //     value = Validations.commonValidation(value);
//                     //     return value;
//                     //   },
//                     //   placeHolder: "Product type",
//                     //   prefix: Image.asset(Assets.vegetables,color:kSecondaryColor),
//                     // ),
//                     productTypeDropDown(),
//                     Obx(() => controller.validationError.value == true &&
//                             controller.selectedProductType.value == ''
//                         ? 5.verticalSpace
//                         : 0.verticalSpace),
//                     Obx(() => controller.validationError.value == true &&
//                             controller.selectedProductType.value == ''
//                         ? Text("Please select a product type",
//                             style: AppTextStyles.normal
//                                 .copyWith(color: Colors.red, fontSize: 12))
//                         : 0.verticalSpace),

//                     SizedBox(height: Get.height * 0.023),
//                     CustomTextField(
//                       controller: controller.productPrice,
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         value = Validations.commonValidation(value, length: 2);
//                         return value;
//                       },
//                       placeHolder: "Product price",
//                       prefix: Image.asset(Assets.vegetables,
//                           color: kSecondaryColor),
//                     ),

//                     SizedBox(height: Get.height * 0.023),
//                     CustomTextField(
//                       controller: controller.description,
//                       placeHolder: "Product Description",
//                       maxLines: 10,
//                       validator: (value) {
//                         value = Validations.commonValidation(value);
//                         return value;
//                       },
//                     ),

//                     SizedBox(height: Get.height * 0.023),

//                     Obx(
//                       () => CustomButton(
//                           title: "Submit",
//                           height: Get.height * 0.07,
//                           width: Get.width * 9,
//                           color: kSecondaryColor,
//                           circular: 30.0,
//                           onPressed: controller.isLoading.value
//                               ? null
//                               : () => {controller.submit()}),
//                     ),
//                     SizedBox(height: Get.height * 0.05),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Obx(() => controller.isLoading.value
//               ? const Center(child: LoadingOverlay())
//               : const SizedBox()), // Show the LoadingOverlay if isLoading is true
//         ],
//       ),
//     );
//   }

//   Widget productTypeDropDown() {
//     return SizedBox(
//       width: Get.width * 0.9,
//       height: 50,
//       child: Obx(
//         () => DecoratedBox(
//           decoration: BoxDecoration(
//               color: Colors.white30,
//               border: Border.all(color: kGreyColor),
//               borderRadius: BorderRadius.circular(15)),
//           child: Container(
//             width: Get.width * 0.9,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//             child: DropdownButton(
//               iconEnabledColor: kSecondaryColor,
//               underline: const SizedBox(),
//               isExpanded: true,
//               hint: Row(
//                 children: [
//                   Image.asset(Assets.vegetables,
//                       color: kSecondaryColor, height: 20, width: 21),
//                   15.horizontalSpace,
//                   Text(
//                       controller.selectedCategory.value.n
//                           ? "Select product type"
//                           : controller.selectedProductType.value,
//                       style: AppTextStyles.normal
//                           .copyWith(fontSize: 12, color: kSecondaryColor)),
//                 ],
//               ),
//               value: controller.selectedProductType.value.isEmpty
//                   ? null
//                   : controller.selectedProductType.value,
//               items: getGuardiansItems(),
//               onChanged: (value) {
//                 controller.selectedProductType.value = value.toString();
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<DropdownMenuItem<String>> getGuardiansItems() {
//     List<DropdownMenuItem<String>> items = [];
//     for (int i = 0; i < controller.productsTypesList.length; i++) {
//       items.add(DropdownMenuItem(
//         value: controller.productsTypesList[i],
//         child: SizedBox(
//             height: 50,
//             child: detailsWithIcon(
//                 controller.productsTypesList[i], controller.iconsList[i])),
//       ));
//     }
//     return items;
//   }

//   Widget detailsWithIcon(String title, String image) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 1,
//           child: Image.asset(image),
//         ),
//         10.horizontalSpace,
//         Expanded(
//             flex: 7,
//             child: Text(title,
//                 style: AppTextStyles.normal
//                     .copyWith(fontSize: 12, color: kSecondaryColor))),
//       ],
//     );
//   }
// }
