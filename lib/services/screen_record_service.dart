import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';

/// Guarda en el backend cada paso completado por la usuaria.
/// El fallo de red no interrumpe el recorrido de la app.
class ScreenRecordService {
  ScreenRecordService._();

  static final ScreenRecordService instance = ScreenRecordService._();

  Future<void> registerScreen(String screen, {Map<String, dynamic>? data}) async {
    try {
      await http
          .post(
            Uri.parse(ApiConstants.registros),
            headers: const {'Content-Type': 'application/json'},
            body: jsonEncode({
              'pantalla': screen,
              'fecha': DateTime.now().toUtc().toIso8601String(),
              if (data != null) 'datos': data,
            }),
          )
          .timeout(const Duration(seconds: 5));
    } catch (_) {
      // No se bloquea la navegación si el backend no está disponible.
    }
  }
}
