import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';

const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorVerde,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: colorCrema,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.diversity_3_rounded,
                size: 80,
                color: colorVerde,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Manos Unidas',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: colorCrema,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mujeres impulsando mujeres',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorDorado,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: colorDorado, strokeWidth: 3),
          ],
        ),
      ),
    );
  }
}
