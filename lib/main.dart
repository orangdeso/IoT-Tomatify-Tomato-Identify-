import 'package:flutter/material.dart';
import 'package:tomato/view/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Tomatify',
      // theme: ThemeData(
      //   primaryColor: Colors.green.shade400,
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: SplassScreen(),
    );
  }
}
