import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'widgets/empty_cart_view.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/cart_checkout_bar.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Your Cart 🛒',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black),
            onPressed: () => controller.clearCart(),
          )
        ],
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) return const EmptyCartView();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return CartItemCard(
                    item: item,
                    onRemove: () => controller.removeItem(item['id']),
                  );
                },
              ),
            ),
            CartCheckoutBar(
              totalPrice: controller.totalPrice,
              onCheckout: () => controller.checkout(),
            ),
          ],
        );
      }),
    );
  }
}