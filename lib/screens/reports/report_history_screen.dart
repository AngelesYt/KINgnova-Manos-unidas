import 'package:flutter/material.dart';
import 'widgets/report_card.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F0),

      appBar: AppBar(
        backgroundColor: const Color(0xff0F8B8D),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Historial de Reportes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              "Consulta el estado de todos los reportes que has realizado.",
              style: TextStyle(fontSize: 16, color: Color(0xff5C3A21)),
            ),

            SizedBox(height: 20),

            ReportCard(title: "Reporte #001"),

            SizedBox(height: 15),

            ReportCard(title: "Reporte #002"),

            SizedBox(height: 15),

            ReportCard(title: "Reporte #003"),

            SizedBox(height: 15),

            ReportCard(title: "Reporte #004"),
          ],
        ),
      ),
    );
  }
}
