import 'dart:async';

import 'package:flutter/material.dart';

import 'screen_record_service.dart';

/// Centraliza el orden de navegación y registra cada pantalla en el backend.
class AppFlow {
  AppFlow._();

  static const home = '/home';
  static const auth = '/login';
  static const market = '/market';
  static const payment = '/payment';
  static const profile = '/profile';
  static const report = '/report';
  static const ads = '/ads';

  static Future<void> goTo(
    BuildContext context,
    String route, {
    Map<String, dynamic>? data,
  }) async {
    final screen = _screenNames[route];
    if (screen != null) {
      unawaited(ScreenRecordService.instance.registerScreen(screen, data: data));
    }
    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  static const _screenNames = <String, String>{
    home: 'home',
    auth: 'auth',
    market: 'market',
    payment: 'metodos_pago',
    profile: 'perfil',
    report: 'reporte',
    ads: 'anuncios',
  };
}
