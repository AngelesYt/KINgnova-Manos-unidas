import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'categories_screen.dart';
import 'product_model.dart';
import 'product_details_screen.dart';

// 1. PALETA DE COLORES CONSTANTES
const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

// Product model and `catalogProducts` are defined in product_model.dart

// 4. PANTALLA PRINCIPAL
class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cabecera del Catálogo (Verde Esmeralda)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 60,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          decoration: const BoxDecoration(
            color: colorVerde, // Uso de la paleta
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'El Trueque',
                    style: TextStyle(
                      color: colorCrema, // Uso de la paleta
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.notifications_none_rounded,
                    color: Color(0xCCF8F5F0), // Crema translúcido
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Componente extraído: Búsqueda
              SearchScreen(),
            ],
          ),
        ),

        // Componente extraído: Categorías
        const CategoriesScreen(),

        // Listado de Productos en Cuadrícula
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.72,
            ),
            itemCount: catalogProducts.length, // Ya no dará error
            itemBuilder: (context, index) {
              final product = catalogProducts[index]; // Ya no dará error
              return _buildProductCard(context, product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // Asume que tu pantalla de detalle se llama ProductDetailsScreen o ProductScreen
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
              color: Color(0x0F5C3A21), // Marrón translúcido
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
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
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
                      color: colorDorado, // Uso de la paleta
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      product.badge,
                      style: const TextStyle(
                        color: colorCrema, // Uso de la paleta
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
                      color: colorMarron, // Uso de la paleta
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: colorVerde, // Uso de la paleta
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
