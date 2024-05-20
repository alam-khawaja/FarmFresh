
import 'package:farm_your_food/app/modules/my_cart/controllers/my_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends GetView<MyCartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(child: Text('Your cart is empty.'));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return ListTile(
                    // leading: Image.network(item.im ?? '', width: 50, height: 50),
                    // title: Text(item.name ?? ''),
                    subtitle: Text('${item.totalPrice} pkr\nQuantity: ${item.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        controller.cartItems.removeAt(index);
                        controller.calculateTotalBill();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Total Bill: ${controller.totalBill} pkr'),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(() => AddShippingAddressPage());
                    },
                    child: Text('Add shipping Address'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(() => SelectPaymentMethodPage());
                    },
                    child: Text('Select payment Method'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.placeOrder();
                    },
                    child: Text('Place order'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
