import 'package:flutter/material.dart';
import 'chat_screen.dart';

// --- COLORES OFICIALES ---
const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

// --- PANTALLA 1: BANDEJA DE ENTRADA (LISTA DE CHATS) ---
class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulación de datos de chats activos (Emprendedoras/Trueques)
    final List<Map<String, String>> chats = [
      {
        'nombre': 'Artesanías Textiles',
        'ultimoMensaje': '¡Hola! Me encanta el bolso. ¿Hacemos el intercambio?',
        'hora': '12:45 PM',
        'iniciales': 'AT',
      },
      {
        'nombre': 'Calzado Hecho a Mano',
        'ultimoMensaje': 'Ya envié tu paquete esta mañana.',
        'hora': 'Ayer',
        'iniciales': 'CH',
      },
      {
        'nombre': 'Eco Jabones Orgánicos',
        'ultimoMensaje': 'Quedamos de vernos en el punto acordado.',
        'hora': 'Lunes',
        'iniciales': 'JO',
      },
    ];

    return Scaffold(
      backgroundColor: colorCrema,
      appBar: AppBar(
        backgroundColor: colorVerde,
        elevation: 0,
        title: const Text(
          'Mis Mensajes',
          style: TextStyle(
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
            color: colorCrema,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Barra de búsqueda interna
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: colorMarron),
              decoration: InputDecoration(
                hintText: 'Buscar mensajes o usuarias...',
                hintStyle: const TextStyle(color: Color(0xff5C3A21)),
                prefixIcon: const Icon(Icons.search_rounded, color: colorVerde),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: colorVerde, width: 1.5),
                ),
              ),
            ),
          ),

          // Lista de conversaciones
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.black12, height: 1),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundColor: colorDorado,
                    child: Text(
                      chat['iniciales']!,
                      style: const TextStyle(
                        color: colorCrema,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Text(
                    chat['nombre']!,
                    style: const TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Arial',
                    ),
                  ),
                  subtitle: Text(
                    chat['ultimoMensaje']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  trailing: Text(
                    chat['hora']!,
                    style: const TextStyle(color: Colors.black45, fontSize: 11),
                  ),
                  onTap: () {
                    // Navegar al chat individual
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailScreen(nombreUsuario: chat['nombre']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}