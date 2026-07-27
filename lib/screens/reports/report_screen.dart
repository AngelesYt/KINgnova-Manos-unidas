import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'widgets/report_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Gestión de Reportes',
                  style: TextStyle(
                    color: Color(0xFF5C3A21),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomButton(text: 'Nuevo Reporte', onPressed: () {}),
              ],
            ),

            const SizedBox(height: 30),

            const ReportCard(),
          ],
        ),
      ),
    );
  }
}
