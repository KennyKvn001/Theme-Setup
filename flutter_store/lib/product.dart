class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// List of sample products
final List<Product> products = [
  Product(
      name: 'Product 1',
      imageUrl: 'https://via.placeholder.com/150',
      price: 29.99),
  Product(
      name: 'Product 2',
      imageUrl: 'https://via.placeholder.com/150',
      price: 49.99),
  Product(
      name: 'Product 3',
      imageUrl: 'https://via.placeholder.com/150',
      price: 19.99),
];
