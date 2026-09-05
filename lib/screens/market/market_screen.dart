import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search_screen.dart';
import 'categories_screen.dart';
import 'product_model.dart';
import 'product_details_screen.dart';
import 'publish_product_screen.dart';
import '../../services/app_flow.dart';

const Color colorVerde = Color(0xff3D5420);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriasController categoryController = Get.put(
      CategoriasController(),
    );
    final ProductsController productsController = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorVerde,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: colorCrema),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'manoslibre_app',
          style: TextStyle(
            color: colorCrema,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: colorCrema,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: colorVerde,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 15), SearchScreen()],
            ),
          ),

          // Componente de Categorías
          CategoriesScreen(),

          // Listado Filtrado de Productos
          Expanded(
            child: Obx(() {
              final seleccion = categoryController.categoriaActiva.value;

              final productosFiltrados = productsController.products.where((product) {
                if (seleccion == 'Todas') return true;
                return product.category == seleccion;
              }).toList();

              if (productosFiltrados.isEmpty) {
                return const Center(
                  child: Text(
                    'No hay productos en esta categoría',
                    style: TextStyle(color: colorMarron, fontSize: 16),
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemCount: productosFiltrados.length,
                itemBuilder: (context, index) {
                  final product = productosFiltrados[index];
                  return _buildProductCard(context, product);
                },
              );
            }),
          ),
        ],
      ),

      // Botón flotante central para publicar productos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PublishProductScreen()),
          );
        },
        backgroundColor: colorDorado,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, color: colorCrema, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Barra de navegación inferior con muesca central y botón de anuncios
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: colorVerde,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Lado Izquierdo: Inicio y Anuncio
              IconButton(
                icon: const Icon(Icons.storefront_rounded, color: colorCrema),
                tooltip: 'Inicio',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.campaign_outlined, color: colorCrema),
                tooltip: 'Anuncios',
                onPressed: () =>
                    AppFlow.goTo(context, AppFlow.ads, replace: false),
              ),

              // Espacio reservado para el botón flotante central (+)
              const SizedBox(width: 32),

              // Lado Derecho: Chat, Pagos y Perfil
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: colorCrema,
                ),
                tooltip: 'Chat',
                onPressed: () =>
                    AppFlow.goTo(context, AppFlow.chatList, replace: false),
              ),
              IconButton(
                icon: const Icon(Icons.payment_rounded, color: colorCrema),
                tooltip: 'Pagos',
                onPressed: () =>
                    AppFlow.goTo(context, AppFlow.payment, replace: false),
              ),
              IconButton(
                icon: const Icon(
                  Icons.person_outline_rounded,
                  color: colorCrema,
                ),
                tooltip: 'Perfil',
                onPressed: () =>
                    AppFlow.goTo(context, AppFlow.profile, replace: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F5C3A21),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: product.imageBytes != null
                    ? Image.memory(
                        product.imageBytes!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, _, _) => const ColoredBox(
                          color: Color(0xFFF1EADF),
                          child: Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorDorado,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      product.badge,
                      style: const TextStyle(
                        color: colorCrema,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: colorVerde,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
