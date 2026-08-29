import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color colorVerde = Color(0xff3D5420);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

// Controlador para manejar el estado de la categoría seleccionada
class CategoriasController extends GetxController {
  var categoriaActiva = 'Todas'.obs;

  void cambiarCategoria(String nuevaCategoria) {
    categoriaActiva.value = nuevaCategoria;
    // Aquí puedes llamar a tu API en Node.js para filtrar los productos
    print('Categoría seleccionada en manoslibre_app: $nuevaCategoria');
  }
}

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  // Inyectamos el controlador
  final CategoriasController controller = Get.put(CategoriasController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            _buildCategoryBadge('Todas'),
            _buildCategoryBadge('🌽 Agricultura'),
            _buildCategoryBadge('🧺 Artesanías'),
            _buildCategoryBadge('🥬 Verduras'),
            _buildCategoryBadge('🧵 Ropa'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(String label) {
    // Obx observa los cambios en la variable categoriaActiva para redibujar solo este widget
    return Obx(() {
      bool isSelected = controller.categoriaActiva.value == label;

      return GestureDetector(
        onTap: () => controller.cambiarCategoria(label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? colorVerde : Colors.white,
            border: Border.all(
              color: isSelected ? colorDorado : const Color(0x1A5C3A21),
              width: isSelected ? 1.5 : 1.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : colorMarron,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 13,
              fontFamily: 'Arial',
            ),
          ),
        ),
      );
    });
  }
}
