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
  });
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
    price: 'Cor 600',
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
        'https://scontent.fmga11-1.fna.fbcdn.net/v/t39.30808-6/489883163_1089107786576777_1942842381142466496_n.jpg?stp=dst-jpg_tt6&cstp=mx2048x1536&ctp=s590x590&_nc_cat=103&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=833d8c&_nc_ohc=7eau-LtX4CkQ7kNvwH8QpP3&_nc_oc=Adp8uii2KhOL9UZiVa-dPE0qJGyf09gqFxe9T16CYhVnv_q6dmc2EZtObZZeRkNs9ENywO6XdZqp7z9z1QN7cTN1&_nc_zt=23&_nc_ht=scontent.fmga11-1.fna&_nc_gid=D37nQ9LflVgtUHcAcnDDVQ&_nc_ss=7b2a8&oh=00_AQJSr3prcfI4Bw1tZTP-zNO2DffDZQgnopLrU7hK6AXsQQ&oe=6A98BC65',
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
