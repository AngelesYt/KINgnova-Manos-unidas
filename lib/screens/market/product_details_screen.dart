import 'package:flutter/material.dart';
import 'product_model.dart';

const Color colorVerde = Color(0xff3D5420);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(
            color: Color(0xff5C3A21), // colorMarron
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff5C3A21)), // colorMarron
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffD4A017), // colorDorado
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          product.badge,
                          style: const TextStyle(
                            color: Color(0xffF8F5F0), // colorCrema
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        product.price,
                        style: const TextStyle(
                          color: Color(0xff3D5420), // colorVerde
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: Color(0xff5C3A21), // colorMarron
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      color: Color(0xff5C3A21), // colorMarron
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Color(0xCC5C3A21), // Marrón al 80%
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Divider(color: Color(0x1A5C3A21)), // Marrón al 10%
                  const SizedBox(height: 15),
                  const Text(
                    'Publicado por',
                    style: TextStyle(
                      color: Color(0xff5C3A21), // colorMarron
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0x145C3A21),
                      ), // Marrón al 8%
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(product.authorAvatar),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.authorName,
                                style: const TextStyle(
                                  color: Color(0xff5C3A21), // colorMarron
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Color(0xffD4A017), // colorDorado
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product.authorLocation,
                                    style: const TextStyle(
                                      color: Color(0x995C3A21), // Marrón al 60%
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Color(0xffD4A017), // colorDorado
                              size: 18,
                            ),
                            SizedBox(width: 2),
                            Text(
                              '4.9',
                              style: TextStyle(
                                color: Color(0xff5C3A21), // colorMarron
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3D5420), // colorVerde
                      foregroundColor: const Color(0xffF8F5F0), // colorCrema
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Abriendo chat de trueque...'),
                          backgroundColor: Color(0xff3D5420), // colorVerde
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_rounded),
                    label: const Text(
                      'Iniciar Negociación',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
