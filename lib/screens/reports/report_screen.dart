import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'widgets/report_card.dart';
import '../../services/app_flow.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xff3D5420),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Gestión de Reportes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Reportes',
                  style: TextStyle(
                    color: Color(0xFF5C3A21),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomButton(
                  text: 'Ver anuncios',
                  onPressed: () => AppFlow.goTo(context, AppFlow.ads),
                ),
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
