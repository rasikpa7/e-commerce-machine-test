import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetask/features/controllers/product_controller.dart';
import 'package:machinetask/model/product_model.dart';
import 'package:machinetask/presentation/screens/productScreen/product_screen.dart';


class HomeScreen extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [IconButton(onPressed: (){
          Get.toNamed('/cart');

        }, icon: const Icon(Icons.shopping_bag))],
      ),
      body: Obx(() {
        if (_productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _productController.products.length,
            itemBuilder: (context, index) {
              final Product product = _productController.products[index];
              return ListTile(
                leading: Image.network(product.imageUrl,width: 50,
                height:50,),
                title: Text(product.name,style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Price: \$${product.price.toStringAsFixed(1)}'), // Format price to two decimal places
                    Text('Description: ${product.description}',overflow: TextOverflow.ellipsis,),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios,size: 18,),
                onTap: () {
    
                  Get.to(() => ProductScreen(product: product));
                },
              );
            },
          );
        }
      }),
    );
  }
}
