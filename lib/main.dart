import 'package:flutter/material.dart';
import 'package:payment_gateway_integration/Screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    home: HomeScreen(),
  ));
}
