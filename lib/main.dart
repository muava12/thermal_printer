import 'package:flutter/material.dart';
import 'package:thermal_printer/screens/home_sreen.dart';
import 'package:thermal_printer/theme/theme.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  KeyboardVisibilityProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thermal Printer',
        theme: ThemeData(
          primaryColor: colorBackgroundDark,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
