import 'dart:typed_data';
import 'package:get/get.dart';

class Product {
  final String title;
  final String description;
  final String imageUrl;
  final String price;
  final String badge;
  final String authorName;
  final String authorLocation;
  final String authorAvatar;
  final String category;
  final Uint8List? imageBytes;

  const Product({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.badge,
    required this.authorName,
    required this.authorLocation,
    required this.authorAvatar,
    required this.category,
    this.imageBytes,
  });
}

/// Catálogo en memoria para que las publicaciones aparezcan de inmediato.
class ProductsController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.assignAll(catalogProducts);
    super.onInit();
  }

  void add(Product product) => products.insert(0, product);
}

final List<Product> catalogProducts = [
  const Product(
    title: 'ventas de verduras',
    description:
        'Producto orgánico cultivado localmente con abonos naturales. Ideal para una alimentación sana en familia.',
    imageUrl:
        'https://canal2tv.com/wp-content/uploads/2024/07/frutas-2-1536x1123.jpg',
    price: 'Cor 350',
    badge: 'Venta',
    authorName: 'María Mendoza',
    authorLocation: 'Estelí, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop',
    category: '🥬 Verduras',
  ),
  const Product(
    title: 'Ropa artesanal',
    description:
        'Elaborada por mujeres rurales utilizando técnicas de costura tradicionales y telas 100% ecológicas.',
    imageUrl:
        'https://www.vostv.com.ni/media/uploads/2023/08/17/whatsapp-image-2023-08-17-at-172325-1.jpeg',
    price: 'Cor 800',
    badge: 'Venta',
    authorName: 'Juana Martínez',
    authorLocation: 'Masaya, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=200&auto=format&fit=crop',
    category: '🧵 Ropa',
  ),
  const Product(
    title: 'Frutas frescas',
    description:
        'Frutas cosechadas el mismo día de la entrega directamente desde comunidades rurales del país.',
    imageUrl:
        'https://media.istockphoto.com/id/501706215/es/foto/frutas-frescas-en-una-mesa-de-madera.jpg?s=612x612&w=0&k=20&c=_xdfs_yc0oiYbGz4-jNKo4So_7ptyTOTIzwjDopEvoY=',
    price: 'C 250',
    badge: 'Venta',
    authorName: 'Sonia Rodríguez',
    authorLocation: 'Matagalpa, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=200&auto=format&fit=crop',
    category: '🌽 Agricultura',
  ),
  const Product(
    title: 'Café artesanal',
    description:
        'Café de altura, secado al sol y tostado artesanalmente. Sabor intenso con notas dulces.',
    imageUrl:
        'https://cdn.faire.com/fastly/d93e752084c17bcbc3590636484a5bdfb3999890f1ca84c187a058291f13c43e.jpeg?bg-color=FFFFFF&dpr=1&fit=crop&format=jpg&height=720&width=720',
    price: 'Cor 420',
    badge: 'Intercambio',
    authorName: 'Elena Flores',
    authorLocation: 'Jinotega, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=200&auto=format&fit=crop',
    category: '🧺 Artesanías',
  ),
];
