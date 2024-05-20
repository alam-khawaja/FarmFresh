// import 'dart:math';

// import 'package:farm_your_food/app/modules/controllers/check_orders_screen_controller.dart';
// import 'package:farm_your_food/global/constants/color_constants.dart';
// import 'package:farm_your_food/global/constants/multiple.dart';
// import 'package:farm_your_food/global/utils/app_text_styles.dart';
// import 'package:farm_your_food/global/utils/widget_spacing.dart';
// import 'package:farm_your_food/global/widgets/loading_overlay.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckOrdersScreen extends GetView<CheckOrderScreenController> {
//   const CheckOrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: Get.height * 0.1),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: Text("Orders",
//                             style: AppTextStyles.loginFontsStyle
//                                 .copyWith(color: kSecondaryColor)),
//                       ),
//                       const Expanded(
//                         child: Icon(Icons.shopping_cart_sharp,
//                             color: kSecondaryColor, size: 30),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: Get.height * 0.03),
//                   20.verticalSpace,
//                   Obx(
//                     () => controller.myOrdersList.isEmpty
//                         ? SizedBox(
//                             height: Get.height,
//                             child: Center(
//                                 child: Text("No Orders",
//                                     style: AppTextStyles.semiBold
//                                         .copyWith(color: kSecondaryColor))))
//                         : SizedBox(
//                             height: Get.height,
//                             child: ListView.builder(
//                               itemCount: controller.myOrdersList.length,
//                               padding: const EdgeInsets.only(bottom: 200),
//                               physics: const AlwaysScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 var data = controller.myOrdersList[index];
//                                 return Padding(
//                                     padding:
//                                         const EdgeInsets.only(bottom: 10.0),
//                                     child: Container(
//                                       decoration: customDecoration(),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 10.0),
//                                         child: Column(
//                                           children: [
//                                             20.verticalSpace,
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text("Total Price",
//                                                     style: AppTextStyles
//                                                         .loginFontsStyle
//                                                         .copyWith(
//                                                             color:
//                                                                 kTertiaryColor,
//                                                             fontSize: 15)),
//                                                 Text(data.totalPrice,
//                                                     style: AppTextStyles
//                                                         .loginFontsStyle
//                                                         .copyWith(
//                                                             color:
//                                                                 kTertiaryColor,
//                                                             fontSize: 15)),
//                                               ],
//                                             ),
//                                             20.verticalSpace,
//                                             ListView.builder(
//                                               shrinkWrap: true,
//                                               itemCount: data.totalOrder.length,
//                                               padding: const EdgeInsets.only(
//                                                   bottom: 200),
//                                               physics:
//                                                   const AlwaysScrollableScrollPhysics(),
//                                               itemBuilder:
//                                                   (BuildContext context,
//                                                       int idx) {
//                                                 var totalOrder =
//                                                     data.totalOrder[idx];
//                                                 return Column(
//                                                   children: [
//                                                     20.verticalSpace,
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("Order no : ",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kTertiaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                         Text(
//                                                             "#${1000 + Random().nextInt(9000)}",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kTertiaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                       ],
//                                                     ),
//                                                     20.verticalSpace,
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("Product Name ",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                         Text(
//                                                             totalOrder
//                                                                 .productName,
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                       ],
//                                                     ),
//                                                     20.verticalSpace,
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("Product Price",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                         Text(
//                                                             totalOrder
//                                                                 .productPrice,
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                       ],
//                                                     ),
//                                                     20.verticalSpace,
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("Product Qty",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                         Text(
//                                                             totalOrder
//                                                                 .productQty,
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                       ],
//                                                     ),
//                                                     20.verticalSpace,
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                             "Product Total Price",
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                         Text(
//                                                             totalOrder
//                                                                 .productTotalPrice,
//                                                             style: AppTextStyles
//                                                                 .loginFontsStyle
//                                                                 .copyWith(
//                                                                     color:
//                                                                         kSecondaryColor,
//                                                                     fontSize:
//                                                                         15)),
//                                                       ],
//                                                     ),
//                                                     20.verticalSpace,
//                                                     verticalLine(
//                                                         color: Colors.white54,
//                                                         width: Get.width),
//                                                   ],
//                                                 );
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ));
//                               },
//                             ),
//                           ),
//                   )
//                 ],
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

//   BoxDecoration customDecoration() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: kPrimaryColor,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 2,
//           blurRadius: 10,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     );
//   }
// }
