import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetask/model/product_model.dart';
import 'package:machinetask/features/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
     
      body: Obx(() {
        final List<Product> cartItems = _cartController.cartItems;
        log(cartItems.length.toString());

        if (cartItems.isEmpty) {
          return const Center(
            child: Text('Your cart is empty.'),
          );
        } else {
          return Scaffold(
            persistentFooterButtons: [
               GestureDetector(
          onTap: (){
            Get.toNamed('/checkout');
          },
          child: Container(height: 50,
              color: Colors.green,
              child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500)),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward,color: Colors.white,)],
              ),),
        )
            ],
            body: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final Product cartProduct = cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      cartProduct.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cartProduct.name),
                    subtitle: Text('\$${cartProduct.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _cartController.decrementQuantity(cartProduct);
                          },
                        ),
                        Text(
                          cartProduct.quantity.toString(),
                          style: const TextStyle(fontSize: 19),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _cartController.incrementQuantity(cartProduct);
                          },
                        ),
                      ],
                    ),
                  
                    onTap: () {
                      _cartController.removeFromCart(cartProduct);
                    },
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
