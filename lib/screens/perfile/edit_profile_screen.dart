import 'package:flutter/material.dart';

const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorCrema = Color(0xffF8F5F0);

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          'Editar Perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffF8F5F0),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xffD4A017),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xffF8F5F0),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff0F8B8D),
                      radius: 18,
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Color(0xffF8F5F0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField("Nombre Completo", "Ej. Ana García"),
            const SizedBox(height: 15),
            _buildTextField("Ubicación", "Ej. Managua, Nicaragua"),
            const SizedBox(height: 15),
            _buildTextField("Teléfono", "Ej. +505 8888 8888"),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0F8B8D),
                foregroundColor: Color(0xffF8F5F0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perfil actualizado correctamente'),
                    backgroundColor: Color(0xff0F8B8D),
                  ),
                );
              },
              child: const Text(
                "Guardar Cambios",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color(0xff5C3A21)),
        filled: true,
        fillColor: Color(0xffF8F5F0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: colorVerde, width: 2),
        ),
      ),
    );
  }
}
