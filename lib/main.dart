import 'package:flutter/material.dart';
import 'splach/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manos Unidas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0F8B8D)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
