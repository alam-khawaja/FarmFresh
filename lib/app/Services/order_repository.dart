import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/app/models/order_model.dart';

class OrderRepository {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final CollectionReference ordersRef = _db.collection('orders');

  OrderRepository._();

  static Future<void> createOrder(OrderModel order) async {
    try {
      await ordersRef.doc(order.id).set(order.toJson());
    } catch (e) {
      print('Error creating order: $e');
      throw Exception('Failed to create order');
    }
  }

  static Future<void> updateOrder(String id, OrderModel order) async {
    try {
      await ordersRef.doc(id).update(order.toJson());
    } catch (e) {
      print('Error updating order: $e');
      throw Exception('Failed to update order');
    }
  }

  static Future<void> deleteOrder(String id) async {
    try {
      await ordersRef.doc(id).delete();
    } catch (e) {
      print('Error deleting order: $e');
      throw Exception('Failed to delete order');
    }
  }

  static Stream<List<OrderModel>> streamOrdersByConsumer(String consumerId) {
    return ordersRef
        .where('consumerId', isEqualTo: consumerId)
        .snapshots()
        .map((QuerySnapshot query) {
      return query.docs
          .map((doc) => OrderModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
