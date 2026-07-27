import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'my_products_screen.dart';

// --- COLORES OFICIALES MANTENIDOS ---
const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class ProfileScreen extends StatelessWidget {
  final String nombreUsuario;
  final String reputacion;
  final String ubicacion;

  const ProfileScreen({
    super.key,
    this.nombreUsuario = "Ana García",
    this.reputacion = "⭐ 4.9 (45 trueques exitosos)",
    this.ubicacion = "Managua, Nicaragua",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F5F0),
      appBar: AppBar(
        backgroundColor: Color(0xff0F8B8D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xffF8F5F0),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mi Perfil',
          style: TextStyle(
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
            color: Color(0xffF8F5F0),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Cabecera del Perfil
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xffD4A017),
                    child: Text(
                      nombreUsuario.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xffF8F5F0),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    nombreUsuario,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5C3A21),
                      fontFamily: 'Arial',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reputacion,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: colorVerde,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ubicacion,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 2. Bloque de Acciones Principales (Editar y Mis Productos)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorVerde,
                      foregroundColor: colorCrema,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.edit_rounded),
                    label: const Text(
                      "Editar Perfil",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorMarron,
                      foregroundColor: colorCrema,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.inventory_2_outlined),
                    label: const Text(
                      "Mis Productos",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProductsScreen(),
                        ),
                      );
                    },
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
