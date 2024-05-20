import 'package:farm_your_food/app/Services/order_repository.dart';
import 'package:farm_your_food/app/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<OrderModel> orders = RxList<OrderModel>();
  String consumerId;

  OrderController(this.consumerId);

  @override
  void onInit() {
    orders.bindStream(OrderRepository.streamOrdersByConsumer(consumerId));
    super.onInit();
  }

  void createOrder(OrderModel order) async {
    try {
      await OrderRepository.createOrder(order);
      orders.add(order);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create order: $e');
    }
  }

  void updateOrder(String id, OrderModel updatedOrder) async {
    try {
      await OrderRepository.updateOrder(id, updatedOrder);
      int index = orders.indexWhere((o) => o.id == id);
      if (index != -1) {
        orders[index] =
            updatedOrder; // Optionally update the list if not streaming
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update order: $e');
    }
  }

  void deleteOrder(String id) async {
    try {
      await OrderRepository.deleteOrder(id);
      orders.removeWhere((o) =>
          o.id == id); // Optionally remove from the list if not streaming
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete order: $e');
    }
  }
}
