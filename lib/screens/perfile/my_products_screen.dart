import 'package:flutter/material.dart';

const Color colorVerde = Color(0xff3D5420);
const Color colorCrema = Color(0xffF8F5F0);

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCrema,
      appBar: AppBar(
        backgroundColor: colorVerde,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: colorCrema),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mis Artículos',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorCrema),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: colorCrema),
            onPressed: () {
              // Navegar a la pantalla de agregar producto
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3, // Cantidad de artículos de ejemplo
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Color(0xff5C3A21)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xffD4A017),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.image, color: Color(0xffD4A017)),
              ),
              title: const Text(
                "Artículo de Trueque",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5C3A21),
                ),
              ),
              subtitle: const Text(
                "Publicado hace 2 días",
                style: TextStyle(fontSize: 12),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () {
                  // Lógica para eliminar producto
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
