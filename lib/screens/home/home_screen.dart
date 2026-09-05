import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- NAVBAR (AppBar) ---
      appBar: AppBar(
        backgroundColor: const Color(0xff3D5420),
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0x26FFFFFF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: ClipOval(
                child: Image.asset(
                  'assents/logo/logo.jpeg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.diversity_3_rounded,
                      color: Colors.white,
                      size: 18,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'manos unidas ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            FeaturesSection(),
            MarketplaceSection(),
            CtaSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

// ==================== COMPONENTES INDEPENDIENTES ====================

// --- HERO SECTION ---
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://radio580nic.s3.amazonaws.com/wp-content/uploads/2026/02/17110022/IMG_9119-1-480x320.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mujeres impulsando ',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Compra, vende e intercambia productos de forma segura dentro de una comunidad digital creada para mujeres emprendedoras.',
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffD4A017),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Get.toNamed('/login'),
            child: const Text(
              'Explorar Marketplace',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// --- FEATURES SECTION ---
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          _buildFeatureCard(
            Icons.store,
            'Marketplace',
            'Compra, vende e intercambia productos entre mujeres emprendedoras.',
          ),
          const SizedBox(height: 20),
          _buildFeatureCard(
            Icons.chat_bubble_outline,
            'Chat Seguro',
            'Conecta directamente con otras usuarias y negocia de forma segura.',
          ),
          const SizedBox(height: 20),
          _buildFeatureCard(
            Icons.star_border,
            'Confianza',
            'Sistema de reputación para generar seguridad y credibilidad.',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 45, color: const Color(0xff3D5420)),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }
}

// --- MARKETPLACE SECTION ---
class MarketplaceSection extends StatelessWidget {
  const MarketplaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Productos Destacados',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff5C3A21),
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildProductCard(
            'https://www.visitcentroamerica.com/wp-content/uploads/2025/04/Masaya-Crafts-Nicaragua-Centroamerica-05.webp',
            'Artesanías',
            'Productos elaborados por emprendedoras.',
          ),
          const SizedBox(height: 25),
          _buildProductCard(
            'https://www.el19digital.com/files/articulos/383439.jpg',
            'Productos',
            'Productos para intercambio.',
          ),
          const SizedBox(height: 25),
          _buildProductCard(
            'https://confidencial.digital/wp-content/uploads/2026/03/emprendimiento-femenino.jpg.webp',
            'Emprendimientos',
            'Impulsando negocios liderados por mujeres.',
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String imageUrl, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff8f8f8),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5C3A21),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- CTA SECTION ---
class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff5C3A21),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      child: Column(
        children: [
          const Text(
            'Empieza a vender hoy mismo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Forma parte de una comunidad digital que impulsa el emprendimiento femenino.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffD4A017),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Get.toNamed('/register'),
            child: const Text(
              'Registrarse',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// --- FOOTER SECTION ---
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff3D5420),
      padding: const EdgeInsets.all(20),
      child: const Text(
        '© 2026 manos unidas | Marketplace para Mujeres Emprendedoras',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
