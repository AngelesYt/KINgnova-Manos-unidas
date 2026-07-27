class Product {
  final String title;
  final String description;
  final String imageUrl;
  final String price;
  final String badge;
  final String authorName;
  final String authorLocation;
  final String authorAvatar;

  const Product({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.badge,
    required this.authorName,
    required this.authorLocation,
    required this.authorAvatar,
  });
}

final List<Product> catalogProducts = [
  const Product(
    title: 'Canasta de verduras',
    description:
        'Producto orgánico cultivado localmente con abonos naturales. Ideal para una alimentación sana en familia.',
    imageUrl:
        'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=1974&auto=format&fit=crop',
    price: 'Cor 350',
    badge: 'Intercambio',
    authorName: 'María Mendoza',
    authorLocation: 'Estelí, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop',
  ),
  const Product(
    title: 'Ropa artesanal',
    description:
        'Elaborada por mujeres rurales utilizando técnicas de costura tradicionales y telas 100% ecológicas.',
    imageUrl:
        'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=2070&auto=format&fit=crop',
    price: 'Cor 600',
    badge: 'Venta',
    authorName: 'Juana Martínez',
    authorLocation: 'Masaya, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=200&auto=format&fit=crop',
  ),
  const Product(
    title: 'Frutas frescas',
    description:
        'Frutas cosechadas el mismo día de la entrega directamente desde comunidades rurales del país.',
    imageUrl:
        'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?q=80&w=2070&auto=format&fit=crop',
    price: 'C 250',
    badge: 'Venta',
    authorName: 'Sonia Rodríguez',
    authorLocation: 'Matagalpa, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=200&auto=format&fit=crop',
  ),
  const Product(
    title: 'Café artesanal',
    description:
        'Café de altura, secado al sol y tostado artesanalmente. Sabor intenso con notas dulces.',
    imageUrl:
        'https://www.visitanicaragua.com/wp-content/uploads/2022/11/Molido-de-cafe-artesanal-Finca-La-Loteria-La-Fundadora-Jinotega.jpg',
    price: 'Cor 420',
    badge: 'Intercambio',
    authorName: 'Elena Flores',
    authorLocation: 'Jinotega, Nicaragua',
    authorAvatar:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=200&auto=format&fit=crop',
  ),
];
