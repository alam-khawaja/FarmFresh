import 'package:farm_your_food/app/Services/order_repository.dart';
import 'package:farm_your_food/app/models/order_model.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  RxList<OrderModel> cartItems = RxList<OrderModel>();
  RxDouble totalBill = 0.0.obs;

  void addToCart(OrderModel order) {
    // Check if product already exists in cart
    int index =
        cartItems.indexWhere((item) => item.productId == order.productId);
    if (index != -1) {
      // Update the quantity and total price if product already in cart
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity! + order.quantity!,
        totalPrice: cartItems[index].totalPrice! + order.totalPrice!,
      );
    } else {
      // Add new product to cart
      cartItems.add(order);
    }
    calculateTotalBill();
  }

  void calculateTotalBill() {
    totalBill.value = cartItems.fold(0, (sum, item) => sum + item.totalPrice!);
  }

  Future<void> placeOrder() async {
    try {
      for (OrderModel order in cartItems) {
        await OrderRepository.createOrder(order);
      }
      Get.snackbar('Success', 'Order placed successfully');
      cartItems.clear();
      calculateTotalBill();
    } catch (e) {
      Get.snackbar('Error', 'Failed to place order: $e');
    }
  }
}
