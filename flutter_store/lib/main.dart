import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX for state management
import 'theme.dart'; // Import your theme.dart file
import 'package:flutter_store/CatalogPage.dart';

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
