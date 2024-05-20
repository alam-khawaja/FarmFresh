// import 'package:farm_your_food/app/controllers/order_controller.dart';
// import 'package:farm_your_food/global/utils/widget_spacing.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../global/widgets/loading_overlay.dart';
// import '../../../../generated/assets.dart';
// import '../../../../global/constants/color_constants.dart';
// import '../../../../global/customs/custom_button.dart';
// import '../../../../global/utils/app_text_styles.dart';
// import '../../../global/constants/multiple.dart';
// import '../../../global/customs/widgets/dashboard_card.dart';

// class OrderScreen extends GetView<OrderScreenController> {
//   const OrderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Obx(
//           () => CustomButton(
//               height: 50,
//               width: double.infinity,
//               color:
//                   controller.cartsList.isEmpty ? kGreyColor : kSecondaryColor,
//               onPressed:
//                   controller.cartsList.isEmpty || controller.isLoading.value
//                       ? null
//                       : () {
//                           _showBottomSheet();
//                         },
//               title: "Order"),
//         ),
//       ),
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
//                         child: Text("Carts",
//                             style: AppTextStyles.loginFontsStyle
//                                 .copyWith(color: kSecondaryColor)),
//                       ),
//                       const Expanded(
//                         child: Icon(Icons.shopping_cart_sharp,
//                             color: kSecondaryColor, size: 30),
//                       ),
//                     ],
//                   ),
//                   10.verticalSpace,
//                   CupertinoButton(
//                     minSize: 0,
//                     padding: EdgeInsets.zero,
//                     color: kTertiaryColor.withOpacity(0.3),
//                     onPressed: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Text("Total Price",
//                                 style: AppTextStyles.loginFontsStyle.copyWith(
//                                     color: kSecondaryColor, fontSize: 20)),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Obx(
//                               () => Text("${controller.totalPrice.value}",
//                                   style: AppTextStyles.loginFontsStyle.copyWith(
//                                       color: kSecondaryColor, fontSize: 20)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: Get.height * 0.03),
//                   20.verticalSpace,
//                   Obx(
//                     () => controller.cartsList.isEmpty
//                         ? SizedBox(
//                             height: Get.height,
//                             child: Center(
//                                 child: Text("No Carts",
//                                     style: AppTextStyles.semiBold
//                                         .copyWith(color: kSecondaryColor))))
//                         : SizedBox(
//                             height: Get.height,
//                             child: ListView.builder(
//                               itemCount: controller.cartsList.length,
//                               padding: const EdgeInsets.only(bottom: 200),
//                               physics: const AlwaysScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 10.0),
//                                   child: ShowProductDetailsCard(
//                                       productImage: Assets.cart,
//                                       productDetailsModel:
//                                           controller.cartsList[index],
//                                       height: Get.height * 0.17,
//                                       isOrderScreen: true,
//                                       onTap: null),
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

//   void _showBottomSheet() {
//     controller.selectedPaymentMethod.value = '';
//     showModalBottomSheet(
//       context: Get.context!,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           height: Get.height * 07,
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             verticalLine(height: 5.0, width: 90.0),
//             20.verticalSpace,
//             const Text(
//               'Select payment method',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             20.verticalSpace,
//             Obx(
//               () => CupertinoButton(
//                 minSize: 0,
//                 padding: EdgeInsets.zero,
//                 color: controller.selectedPaymentMethod.value == "EasyPaisa"
//                     ? Colors.blue.shade100
//                     : Colors.transparent,
//                 onPressed: () {
//                   controller.selectedPaymentMethod.value = "EasyPaisa";
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: CircleAvatar(
//                           radius: 40,
//                           backgroundColor: kSecondaryColor,
//                           child: CircleAvatar(
//                               radius: 41,
//                               backgroundColor: Colors.black12,
//                               backgroundImage: AssetImage(Assets.easyPaisa)
//                               //CachedNetworkImageProvider(model.image!),
//                               ),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Expanded(
//                           flex: 6,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'EasyPaisa',
//                                 style: TextStyle(
//                                     color: kSecondaryColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Obx(() => CupertinoButton(
//                   minSize: 0,
//                   padding: EdgeInsets.zero,
//                   color: controller.selectedPaymentMethod.value == "JazzCash"
//                       ? Colors.blue.shade100
//                       : Colors.transparent,
//                   onPressed: () {
//                     controller.selectedPaymentMethod.value = "JazzCash";
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: CircleAvatar(
//                             radius: 40,
//                             backgroundColor: kSecondaryColor,
//                             child: CircleAvatar(
//                                 radius: 41,
//                                 backgroundColor: Colors.black12,
//                                 backgroundImage: AssetImage(Assets.jazzCash)
//                                 //CachedNetworkImageProvider(model.image!),
//                                 ),
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Expanded(
//                             flex: 6,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'JazzCash',
//                                   style: TextStyle(
//                                       color: kSecondaryColor,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                   ),
//                 )),
//             const SizedBox(height: 20),
//             30.verticalSpace,
//             CustomButton(
//                 height: 50,
//                 width: double.infinity,
//                 color: kSecondaryColor,
//                 onPressed: () {
//                   controller.addOrder();
//                 },
//                 title: "Submit"),
//             15.verticalSpace,
//           ]),
//         );
//       },
//     );
//   }
// }
