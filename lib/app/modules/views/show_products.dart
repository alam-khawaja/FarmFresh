// import 'package:farm_your_food/global/utils/widget_spacing.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../global/widgets/loading_overlay.dart';
// import '../../../../global/constants/color_constants.dart';
// import '../../../../global/customs/custom_button.dart';
// import '../../../../global/utils/app_text_styles.dart';
// import '../../../global/constants/multiple.dart';
// import '../../../global/customs/widgets/dashboard_card.dart';

// class ShowProductsScreen extends StatelessWidget {
//   const ShowProductsScreen({super.key});

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
//                         child: Text("Products",
//                             style: AppTextStyles.loginFontsStyle
//                                 .copyWith(color: kSecondaryColor)),
//                       ),
//                       Expanded(
//                         child: Image.asset(controller.productTypeImage.value),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: Get.height * 0.03),
//                   20.verticalSpace,
//                   Obx(
//                     () =>
//                     controller.productsList.isEmpty
//                         ?

//                            SizedBox(
//                             height: Get.height,
//                             child: Center(
//                                 child: Text("No Products",
//                                     style: AppTextStyles.semiBold
//                                         .copyWith(color: kSecondaryColor)))),
//                         // : SizedBox(
//                         //     height: Get.height,
//                         //     child: ListView.builder(
//                         //       itemCount: controller.productsList.length,
//                         //       padding: const EdgeInsets.only(bottom: 200),
//                         //       physics: const AlwaysScrollableScrollPhysics(),
//                         //       itemBuilder: (BuildContext context, int index) {
//                         //         return Padding(
//                                   padding: const EdgeInsets.only(bottom: 10.0),
//                                   child: ShowProductDetailsCard(
//                                       productDetailsModel:
//                                           controller.productsList[index],
//                                       height: Get.height * 0.17,
//                                       productImage:
//                                           controller.productTypeImage.value,
//                                       onTap: () {
//                                         _showBottomSheet(
//                                             controller.productsList[index]);
//                                         // Get.toNamed(Routes.signup,arguments: "user");
//                                       }),
//                                 );
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

//   void _showBottomSheet(ProductDetailsModel model) {
//     controller.productQty.value = 0;
//     showModalBottomSheet(
//       context: Get.context!,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           height: Get.height * 1,
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             verticalLine(height: 5.0, width: 90.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundColor: kSecondaryColor,
//                     child: CircleAvatar(
//                         radius: 41,
//                         backgroundColor: Colors.black12,
//                         backgroundImage:
//                             AssetImage(controller.productTypeImage.value)
//                         //CachedNetworkImageProvider(model.image!),
//                         ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                     flex: 6,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${model.productName}',
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Price : ${model.productPrice}',
//                           style:
//                               const TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ],
//                     ))
//               ],
//             ),
//             const SizedBox(height: 20),
//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         CupertinoButton(
//                           minSize: 0,
//                           padding: EdgeInsets.zero,
//                           onPressed: () {
//                             if (controller.productQty > 0) {
//                               controller.productQty--;
//                             }
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             color: kRedColor,
//                             child: const Icon(Icons.remove, color: kWhiteColor),
//                           ),
//                         ),
//                         5.horizontalSpace,
//                         Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: kSecondaryColor)),
//                           child: Obx(() => Center(
//                               child: Text("${controller.productQty.value}",
//                                   style: AppTextStyles.semiBold))),
//                         ),
//                         5.horizontalSpace,
//                         CupertinoButton(
//                           minSize: 0,
//                           padding: EdgeInsets.zero,
//                           onPressed: () {
//                             controller.productQty++;
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             color: kSecondaryColor,
//                             child: const Icon(Icons.add, color: kWhiteColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Obx(() => controller.addingIntoCart.value
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               color: kSecondaryColor,
//                             ))
//                         : controller.productQty > 0
//                             ? CupertinoButton(
//                                 minSize: 0,
//                                 padding: EdgeInsets.zero,
//                                 onPressed: () {
//                                   controller.addToCart(model);
//                                 },
//                                 child: const Icon(
//                                   Icons.shopping_cart,
//                                   color: kSecondaryColor,
//                                 ))
//                             : const Icon(Icons.remove_shopping_cart,
//                                 color: kGreyColor))
//                   ],
//                 )),
//             30.verticalSpace,
//             CustomButton(
//                 height: 50,
//                 width: double.infinity,
//                 color: kSecondaryColor,
//                 onPressed: () {
//                   controller.viewPredictions.value = true;
//                 },
//                 title: "View Price Prediction"),
//             15.verticalSpace,
//             Obx(
//               () => Visibility(
//                 visible: controller.viewPredictions.value,
//                 child: SingleChildScrollView(
//                   child: SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                         itemCount: 5,
//                         padding: const EdgeInsets.only(bottom: 200),
//                         physics: const AlwaysScrollableScrollPhysics(),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("June Estimated Price",
//                                   style: AppTextStyles.semiBold
//                                       .copyWith(fontSize: 15)),
//                               Text("140pkr",
//                                   style: AppTextStyles.medium
//                                       .copyWith(fontSize: 15)),
//                             ],
//                           );
//                         }),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         );
//       },
//     );
//   }
// }
