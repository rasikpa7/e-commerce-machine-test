import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetask/features/controllers/cart_controller.dart';
import 'package:machinetask/model/product_model.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  ProductScreen({Key? key, required this.product}) : super(key: key);
  final CartController _cartController = Get.put(CartController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 50),
            Text('Product Name: ${product.name}',
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 27)),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            Text('Description: ${product.description}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _cartController.addToCart(product);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
