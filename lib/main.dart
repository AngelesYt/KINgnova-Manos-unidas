import 'package:flutter/material.dart';

// Importación de pantallas organizadas por carpetas
import 'splach/splach_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/recover_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/market/market_screen.dart';
import 'screens/market/categories_screen.dart';
import 'screens/market/search_screen.dart';
import 'screens/market/product_details_screen.dart';
import 'screens/chat/chat_list_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/perfile/perfile_screen.dart';
import 'screens/perfile/edit_perfile_screen.dart';
import 'screens/perfile/my_products_screen.dart';
import 'screens/reports/report_screen.dart';
import 'screens/reports/report_history_screen.dart';
import 'settings/settings_screen.dart';
import 'screens/metodo_pago/payment_screen.dart';
import 'screens/anuncio/ads_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manos Unidas', // Actualizado a tu nuevo nombre
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/recover_password': (context) => const RecoverPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/market': (context) => const MarketScreen(),

        // --- SOLUCIÓN AL ERROR AQUÍ ---
        // Extraemos los argumentos de la ruta dinámicamente sin usar 'const'
        '/product_details': (context) {
          final productArgs = ModalRoute.of(context)!.settings.arguments;
          // Cuando navegues a esta pantalla deberás pasar el argumento así:
          // Navigator.pushNamed(context, '/product_details', arguments: miProducto);
          return ProductDetailsScreen(
            product: productArgs as dynamic,
          ); // Cambia 'dynamic' por tu modelo 'Product' si lo tienes
        },

        '/categories': (context) => CategoriesScreen(),
        '/search': (context) => const SearchScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/chat_list': (context) =>
            const ChatInboxScreen(), // Ajustado al nombre de tu clase
        '/chat': (context) => const ChatDetailScreen(nombreUsuario: 'Chat'),
        '/profile': (context) => const ProfileScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/my_products': (context) => const MyProductsScreen(),
        '/report': (context) => const ReportScreen(),
        '/report_history': (context) => const ReportHistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/ads': (context) => const AdsScreen(),
      },
    );
  }
}
