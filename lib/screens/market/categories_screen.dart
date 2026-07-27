import 'package:flutter/material.dart';

const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0x1A5C3A21)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff5C3A21), // colorMarron
          fontWeight: FontWeight.bold,
          fontSize: 13,
          fontFamily: 'Arial',
        ),
      ),
    );
  }
}
