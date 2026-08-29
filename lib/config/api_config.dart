// lib/constants/api_constants.dart

class ApiConstants {
  // ATENCIÓN:
  // Si usas el emulador de Android, usa 'http://10.0.2.2:3000/api'
  // Si usas tu celular físico por WiFi, pon la IP local de tu computadora (ej: 'http://192.168.1.5:3000/api')
  static const String baseUrl = 'http://10.0.2.2:3000/api';

  // Endpoints principales de Manos Unidas
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String productos = '$baseUrl/productos';
  static const String categorias = '$baseUrl/categorias';
  static const String anuncios = '$baseUrl/anuncios';
  static const String pagos = '$baseUrl/pagos';
  static const String registros = '$baseUrl/registros';
}
