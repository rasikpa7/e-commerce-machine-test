import 'package:get/get.dart';
import 'package:machinetask/model/product_model.dart'; // Import your Product model
import 'dart:math';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      List<Product> fetchedProducts = generateMockProducts(10);
      products.assignAll(fetchedProducts);
      isLoading.value = false;
    } catch (e) {
    
      isLoading.value = false;
    }
  }

  List<Product> generateMockProducts(int count) {
    List<Product> mockProducts = [];

    for (int i = 0; i < count; i++) {
      int id = i + 1; // Generating unique IDs for mock products
      String name = 'Product ${i + 1}';
      double price = (Random().nextDouble() * 100).toDouble();
      String description = 'Description for Product ${i + 1}';
      String imageUrl = 'https://via.placeholder.com/150'; 

      mockProducts.add(
        Product(
          id: id,
          name: name,
          price: price,
          description: description,
          imageUrl: imageUrl,
        ),
      );
    }

    return mockProducts;
  }
}
