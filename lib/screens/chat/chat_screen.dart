import 'package:flutter/material.dart';
import 'chat_list_screen.dart'; // Importado para reutilizar las paletas de color

// --- PANTALLA 2: CONVERSACIÓN INDIVIDUAL ---
class ChatDetailScreen extends StatefulWidget {
  final String nombreUsuario;
  const ChatDetailScreen({super.key, required this.nombreUsuario});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  // Lista simulada de mensajes (esMio define si lo envías tú o la otra persona)
  final List<Map<String, dynamic>> _mensajes = [
    {'texto': '¡Hola! Vi tu publicación del vestido tejido.', 'esMio': false},
    {
      'texto':
          '¡Hola! Qué bueno que te guste. Sí, está disponible para intercambio.',
      'esMio': true,
    },
    {
      'texto':
          '¿Te interesaría cambiarlo por uno de mis calzados hechos a mano?',
      'esMio': false,
    },
    {
      'texto':
          'Me encantaría. Déjame revisar tu catálogo para elegir el modelo.',
      'esMio': true,
    },
  ];

  void _enviarMensaje() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _mensajes.add({'texto': _messageController.text.trim(), 'esMio': true});
        _messageController.clear();
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

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
        title: Text(
          widget.nombreUsuario,
          style: const TextStyle(
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
            color: colorCrema,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.handshake_outlined, color: colorDorado),
            tooltip: 'Cerrar Trueque',
            onPressed: () {
              // Simulación de acción de trato comercial
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Área de mensajes
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _mensajes.length,
              itemBuilder: (context, index) {
                final msg = _mensajes[index];
                final bool esMio = msg['esMio'];

                return Align(
                  alignment: esMio
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: esMio ? colorVerde : Colors.white,
                      border: esMio
                          ? null
                          : Border.all(color: const Color(0xff5C3A21)),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(esMio ? 16 : 0),
                        bottomRight: Radius.circular(esMio ? 0 : 16),
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    child: Text(
                      msg['texto'],
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: esMio ? colorCrema : colorMarron,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Barra inferior para escribir mensajes
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Campo de entrada de texto
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: colorMarron),
                      decoration: const InputDecoration(
                        hintText: 'Escribe un mensaje...',
                        hintStyle: TextStyle(color: Colors.black38),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),

                  // Botón de enviar (Dorado para resaltar la acción)
                  IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      color: colorDorado,
                      size: 28,
                    ),
                    onPressed: _enviarMensaje,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}