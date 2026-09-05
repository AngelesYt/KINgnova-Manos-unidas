import 'dart:async';

import 'package:flutter/material.dart';

import 'screen_record_service.dart';

class AppFlow {
  AppFlow._();

  // ============================================================
  // SPLASH E INICIO
  // ============================================================

  static const splash = '/splash';

  static const welcome = '/welcome';

  // ============================================================
  // HOME PRINCIPAL
  // ============================================================

  static const home = '/home';

  // ============================================================
  // AUTENTICACIÓN
  // ============================================================

  static const login = '/login';

  static const register = '/register';

  static const verifyAccount = '/verify_account';

  static const recoverPassword = '/recover_password';

  // ============================================================
  // MARKETPLACE
  // ============================================================

  static const market = '/market';

  static const categories = '/categories';

  static const search = '/search';

  static const productDetails = '/product_details';

  // ============================================================
  // PRODUCTOS
  // ============================================================

  static const createProduct = '/create_product';

  static const editProduct = '/edit_product';

  static const myProducts = '/my_products';

  // ============================================================
  // INTERCAMBIOS
  // ============================================================

  static const proposeExchange = '/propose_exchange';

  static const exchangeHistory = '/exchange_history';

  static const exchangeDetails = '/exchange_details';

  // ============================================================
  // PAGOS
  // ============================================================

  /// Métodos de pago disponibles para un producto.
  static const payment = '/payment';

  /// Confirmación del pago.
  static const paymentConfirmation = '/payment_confirmation';

  // ============================================================
  // CHAT
  // ============================================================

  static const chatList = '/chat_list';

  static const chat = '/chat';

  // ============================================================
  // PERFIL
  // ============================================================

  static const profile = '/profile';

  static const editProfile = '/edit_profile';

  // ============================================================
  // REPORTES
  // ============================================================

  /// Crear un reporte general.
  static const report = '/report';

  /// Reportar específicamente un producto.
  static const reportProduct = '/report_product';

  /// Historial de reportes realizados.
  static const reportHistory = '/report_history';

  // ============================================================
  // ANUNCIOS Y PROMOCIÓN
  // ============================================================

  /// Gestión general de anuncios.
  static const ads = '/ads';

  /// Seleccionar un producto para promocionarlo.
  static const promoteProduct = '/promote_product';

  /// Seleccionar una membresía.
  static const membership = '/membership';

  /// Historial de promociones del usuario.
  static const promotionHistory = '/promotion_history';

  // ============================================================
  // CONFIGURACIÓN
  // ============================================================

  static const settings = '/settings';

  // ============================================================
  // NAVEGACIÓN
  // ============================================================

  /// Navega hacia una pantalla y registra la navegación.
  ///
  /// [context] Contexto actual.
  ///
  /// [route] Ruta definida dentro de AppFlow.
  ///
  /// [data] Información adicional que puede registrarse
  /// en el backend.
  ///
  /// [arguments] Datos enviados a la siguiente pantalla.
  ///
  /// [replace]
  /// true  = reemplaza la pantalla actual.
  /// false = conserva la pantalla anterior en el historial.
  static Future<void> goTo(
    BuildContext context,
    String route, {
    Map<String, dynamic>? data,
    Object? arguments,
    bool replace = true,
  }) async {
    final screen = _screenNames[route];

    // Registrar la pantalla en el backend sin bloquear
    // la navegación del usuario.
    if (screen != null) {
      unawaited(
        ScreenRecordService.instance.registerScreen(screen, data: data),
      );
    }

    if (!context.mounted) return;

    if (replace) {
      Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
    } else {
      Navigator.of(context).pushNamed(route, arguments: arguments);
    }
  }

  // ============================================================
  // VOLVER
  // ============================================================

  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  // ============================================================
  // IR AL INICIO
  // ============================================================

  static Future<void> goHome(BuildContext context) async {
    await goTo(context, home, replace: true);
  }

  // ============================================================
  // NOMBRES PARA EL BACKEND / REGISTRO DE PANTALLAS
  // ============================================================

  static const Map<String, String> _screenNames = {
    // ----------------------------------------------------------
    // SPLASH E INICIO
    // ----------------------------------------------------------
    splash: 'splash',

    welcome: 'inicio',

    // ----------------------------------------------------------
    // AUTENTICACIÓN
    // ----------------------------------------------------------
    login: 'login',

    register: 'registro',

    verifyAccount: 'verificacion_cuenta',

    recoverPassword: 'recuperar_password',

    // ----------------------------------------------------------
    // HOME
    // ----------------------------------------------------------
    home: 'home_principal',

    // ----------------------------------------------------------
    // MARKETPLACE
    // ----------------------------------------------------------
    market: 'marketplace',

    categories: 'categorias',

    search: 'buscar',

    productDetails: 'detalle_producto',

    // ----------------------------------------------------------
    // PRODUCTOS
    // ----------------------------------------------------------
    createProduct: 'crear_producto',

    editProduct: 'editar_producto',

    myProducts: 'mis_productos',

    // ----------------------------------------------------------
    // INTERCAMBIOS
    // ----------------------------------------------------------
    proposeExchange: 'proponer_intercambio',

    exchangeHistory: 'historial_intercambios',

    exchangeDetails: 'detalle_intercambio',

    // ----------------------------------------------------------
    // PAGOS
    // ----------------------------------------------------------
    payment: 'metodos_pago',

    paymentConfirmation: 'confirmacion_pago',

    // ----------------------------------------------------------
    // CHAT
    // ----------------------------------------------------------
    chatList: 'lista_chats',

    chat: 'chat',

    // ----------------------------------------------------------
    // PERFIL
    // ----------------------------------------------------------
    profile: 'perfil',

    editProfile: 'editar_perfil',

    // ----------------------------------------------------------
    // REPORTES
    // ----------------------------------------------------------
    report: 'crear_reporte',

    reportProduct: 'reportar_producto',

    reportHistory: 'historial_reportes',

    // ----------------------------------------------------------
    // ANUNCIOS Y PROMOCIÓN
    // ----------------------------------------------------------
    ads: 'anuncios',

    promoteProduct: 'promocionar_producto',

    membership: 'membresias',

    promotionHistory: 'historial_promociones',

    // ----------------------------------------------------------
    // CONFIGURACIÓN
    // ----------------------------------------------------------
    settings: 'configuracion',
  };
}
