import 'package:flutter/material.dart';
import 'login_screen.dart'; // Para colores

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitRecovery() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: colorCrema,
          title: const Icon(
            Icons.mark_email_read_rounded,
            size: 60,
            color: colorVerde,
          ),
          content: const Text(
            'Hemos enviado un enlace de recuperación a tu correo.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: colorMarron, fontWeight: FontWeight.bold),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Regresa al Login
              },
              child: const Text(
                'Volver al inicio',
                style: TextStyle(fontWeight: FontWeight.bold, color: colorVerde),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCrema,
      appBar: AppBar(
        backgroundColor: colorCrema,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: colorVerde),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.lock_reset_rounded, size: 80, color: colorDorado),
              const SizedBox(height: 20),
              const Text(
                'Recuperar Contraseña',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: colorMarron),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos instrucciones para restablecer tu contraseña.',
                style: TextStyle(color: colorMarron, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),

              // Correo Electrónico
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: colorMarron),
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle: const TextStyle(color: colorMarron),
                  prefixIcon: const Icon(Icons.email_outlined, color: colorVerde),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: colorMarron),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: colorVerde, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingresa tu correo';
                  if (!RegExp(r'^[\w-\.]+\@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Correo no válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorVerde,
                  foregroundColor: colorCrema,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                onPressed: _submitRecovery,
                child: const Text('Enviar Instrucciones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}