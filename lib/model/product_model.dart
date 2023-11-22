class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.quantity = 1, // Default quantity is set to 1 when a product is added to the cart
  });

  Product copyWith({int? quantity}) {
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl,
      quantity: quantity ?? this.quantity, // If quantity is not provided, use the existing quantity
    );
  }
}
