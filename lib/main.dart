import 'package:flutter/material.dart';
import 'package:homescreen_compassapp/screen/home_screen.dart';
import 'package:homescreen_compassapp/theme/theme_data.dart'; // Đảm bảo file này tồn tại

void main() {
  runApp(const AppCompass());
}

class AppCompass extends StatelessWidget {
  const AppCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.myTheme(), // Sử dụng theme tùy chỉnh
      home: const HomeScreen(),
    );
  }
}
