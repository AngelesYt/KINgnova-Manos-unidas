import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Splash
import 'splach/splach_screen.dart';

// Home
import 'screens/home/home_screen.dart';

// Auth
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/recover_password_screen.dart';

// Marketplace
import 'screens/market/market_screen.dart';
import 'screens/market/categories_screen.dart';
import 'screens/market/search_screen.dart';
import 'screens/market/product_details_screen.dart';

// Chat
import 'screens/chat/chat_list_screen.dart';
import 'screens/chat/chat_screen.dart';

// Perfil
import 'screens/perfile/perfile_screen.dart';
import 'screens/perfile/edit_perfile_screen.dart';
import 'screens/perfile/my_products_screen.dart';

// Reportes
import 'screens/reports/report_screen.dart';
import 'screens/reports/report_history_screen.dart';

// Configuración
import 'settings/settings_screen.dart';

// Pago
import 'screens/metodo_pago/payment_screen.dart';

// Anuncios
import 'screens/anuncio/ads_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manos Unidas',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0F8B8D)),
        scaffoldBackgroundColor: const Color(0xffF8F5F0),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/recover_password': (context) => const RecoverPasswordScreen(),
        '/market': (context) => const MarketScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/search': (context) => const SearchScreen(),

        // DETALLE DEL PRODUCTO
        '/product_details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;

          if (args == null) {
            return const Scaffold(
              body: Center(
                child: Text('No se recibió información del producto.'),
              ),
            );
          }

          return ProductDetailsScreen(product: args as dynamic);
        },

        '/payment': (context) => const PaymentScreen(),
        '/chat_list': (context) => const ChatInboxScreen(),
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
