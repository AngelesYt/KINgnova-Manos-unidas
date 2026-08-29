import 'package:flutter/material.dart';

const Color colorVerde = Color(0xff3D5420);
const Color colorCrema = Color(0xffF8F5F0);

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar productos para trueque...',
        hintStyle: const TextStyle(color: Color(0x805C3A21)),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color(0xff0F8B8D), // colorVerde
        ),
        filled: true,
        fillColor: const Color(0xffF8F5F0), // colorCrema
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
