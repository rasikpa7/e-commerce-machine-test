import 'package:get/get.dart';
import 'package:machinetask/model/product_model.dart';
import 'package:machinetask/presentation/components/snakbar.dart';


class CartController extends GetxController {
  var cartItems = List<Product>.empty().obs;

  void addToCart(Product product) {
    if (cartItems.contains(product)) {
      int index = cartItems.indexWhere((item) => item.id == product.id);
      cartItems[index].quantity++;
      Shared().snakbar(title: product.name, message: 'Quantity increased');
    } else {
      cartItems.add(product);
       Shared().snakbar(title: product.name, message: 'Added');
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.id == product.id);
    Shared().snakbar(title: 'Product ${product.name}', message: 'has been removed');
  }

  void incrementQuantity(Product product) {
    int index = cartItems.indexWhere((item) => item.id == product.id);
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decrementQuantity(Product product) {
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    } else {
      removeFromCart(product);
      cartItems.refresh();
    }
  }

   double calculateTotalAmount() {
    double totalAmount = 0.0;
    for (var product in cartItems) {
      totalAmount += (product.price * product.quantity);
    }
    return totalAmount;
  }
}
