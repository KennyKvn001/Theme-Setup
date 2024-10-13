import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX for state management
import 'product.dart'; // Import product.dart

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
