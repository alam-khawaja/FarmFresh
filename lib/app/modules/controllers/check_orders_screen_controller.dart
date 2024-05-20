// import 'package:farm_your_food/app/modules/models/order_model.dart';
// import 'package:get/get.dart';

// import '../../Services/product_services.dart';

// class CheckOrderScreenController extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool orderSubmitting = false.obs;
//   RxInt totalPrice = 0.obs;

//   RxList<OrderModel> myOrdersList = <OrderModel>[].obs;

//   getOrders() async {
//     // try{
//     isLoading.value = true;
//     myOrdersList.value = await ProductServices.fetchOrders();
//     isLoading.value = false;
//     // }catch(e){
//     //   isLoading.value = true;
//     // }
//   }

//   @override
//   void onInit() {
//     getOrders();
//     super.onInit();
//   }
// }
