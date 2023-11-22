import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetask/model/product_model.dart';
import 'package:machinetask/features/controllers/cart_controller.dart'; 

class CheckoutScreen extends StatelessWidget {
  final CartController _cartController = Get.find(); 

  @override
  Widget build(BuildContext context) {
    List<Product> cartItems = _cartController.cartItems;
    double totalAmount = _cartController.calculateTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final Product cartProduct = cartItems[index];
                return ListTile(
                  title: Text(cartProduct.name,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  subtitle: Text('\$${cartProduct.price.toStringAsFixed(2)}'),
                  trailing: Text('Qty: ${cartProduct.quantity.toString()}',),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
            decoration: BoxDecoration(border: Border.all(),
            borderRadius: BorderRadius.circular(10)),
            
            child: Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          
        ],
      ),
    );
  }
}
