// import 'package:farm_your_food/global/utils/widget_spacing.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../global/widgets/loading_overlay.dart';
// import '../../../../generated/assets.dart';
// import '../../../../global/constants/color_constants.dart';
// import '../../../../global/customs/custom_button.dart';
// import '../../../../global/customs/custom_text_field.dart';
// import '../../../../global/utils/app_text_styles.dart';
// import '../../../../global/validations/validation.dart';
// import '../../controllers/store_controller.dart';

// class CreateStore extends GetView<CreateStoreController> {
//   const CreateStore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Form(
//                 key: controller.formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: Get.height * 0.1),
//                     Text("Create Store ",
//                         style: AppTextStyles.loginFontsStyle
//                             .copyWith(color: kSecondaryColor)),
//                     SizedBox(height: Get.height * 0.03),
//                     20.verticalSpace,
//                     CustomTextField(
//                       controller: controller.storeName,
//                       placeHolder: "Store name",
//                       validator: (value) {
//                         value = Validations.commonValidation(value);
//                         return value;
//                       },
//                       prefix: Image.asset(Assets.store, color: kSecondaryColor),
//                     ),
//                     SizedBox(height: Get.height * 0.023),
//                     CustomTextField(
//                       controller: controller.storeType,
//                       validator: (value) {
//                         value = Validations.commonValidation(value);
//                         return value;
//                       },
//                       placeHolder: "Store type",
//                       prefix: Image.asset(Assets.store, color: kSecondaryColor),
//                     ),
//                     SizedBox(height: Get.height * 0.023),
//                     CustomTextField(
//                       controller: controller.description,
//                       placeHolder: "Store Description",
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
// }
