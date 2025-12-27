import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/routing/app_router.dart';
import 'package:furniture_ecommerce_app/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Furniture Ecommerce App',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
