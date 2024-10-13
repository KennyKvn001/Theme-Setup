import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX for state management

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store',
      theme: AppTheme.lightTheme, // Use light theme as default
      darkTheme: AppTheme.darkTheme, // Define dark theme
      themeMode: ThemeMode.light, // Default theme mode
      home: CatalogPage(),
    );
  }
}

class AppTheme {
  // Define primary colors for the light and dark themes
  static const Color primaryLight = Colors.blue;
  static const Color primaryDark = Colors.teal;

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark,
    ),
  );
}

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

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isDarkMode = false; // Variable to track theme mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'),
        actions: [
          // Toggle button to switch between themes
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              Get.changeThemeMode(
                  isDarkMode ? ThemeMode.dark : ThemeMode.light);
            },
          ),
        ],
      ),
      body: ProductGrid(), // Widget to show the products
    );
  }
}

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Animate opacity on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 2),
          child: GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: product.name,
                middleText: 'Price: \$${product.price}',
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(product.imageUrl, height: 120),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                  Text('\$${product.price.toString()}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
