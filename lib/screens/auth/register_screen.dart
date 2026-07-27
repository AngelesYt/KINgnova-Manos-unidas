import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart'; // Para reutilizar constantes de color y estilos

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fotoCedulacontroller = TextEditingController();
  String? _capturedPhotoName;

  @override
  void dispose() {
    _nameController.dispose();
    _codePostalController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fotoCedulacontroller.dispose();
    super.dispose();
  }

  void _simularAdjuntarCedula() {
    setState(() {
      _capturedPhotoName = "cedula_documento_9941.pdf";
      _fotoCedulacontroller.text = _capturedPhotoName!;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cédula adjuntada correctamente.', style: TextStyle(color: colorCrema)),
        backgroundColor: colorVerde,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _submitRegister() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: colorCrema,
          title: const Icon(
            Icons.check_circle_outline_rounded,
            size: 60,
            color: colorVerde,
          ),
          content: const Text(
            '¡Registro exitoso! Cuenta creada correctamente.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: colorMarron, fontWeight: FontWeight.bold),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra diálogo
                Navigator.pop(context); // Vuelve al login
              },
              child: const Text(
                'Entendido',
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
        backgroundColor: colorVerde,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: colorCrema),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabecera simplificada
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                color: colorVerde,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: const Column(
                children: [
                  Icon(Icons.diversity_3_rounded, size: 45, color: colorCrema),
                  SizedBox(height: 10),
                  Text(
                    'Únete a Manos Unidas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorCrema),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Regístrate',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: colorMarron),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Compra, vende e intercambia productos de forma segura dentro de una comunidad digital creada para mujeres emprendedoras.',
                      style: TextStyle(color: colorMarron, fontSize: 13.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),

                    // Nombre
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(color: colorMarron),
                      decoration: _inputDecoration('Nombre Completo / Emprendimiento', Icons.person_outline_rounded),
                      validator: (value) => (value == null || value.trim().isEmpty) ? 'Ingresa tu nombre' : null,
                    ),
                    const SizedBox(height: 15),

                    // Código Postal
                    TextFormField(
                      controller: _codePostalController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: const TextStyle(color: colorMarron),
                      decoration: _inputDecoration('Código Postal', Icons.map_outlined),
                      validator: (value) => (value == null || value.trim().isEmpty) ? 'Ingresa tu código postal' : null,
                    ),
                    const SizedBox(height: 15),

                    // Cédula
                    TextFormField(
                      controller: _fotoCedulacontroller,
                      readOnly: true,
                      onTap: _simularAdjuntarCedula,
                      style: const TextStyle(color: colorMarron),
                      decoration: _inputDecoration('Documento de Identidad / Cédula', Icons.badge_outlined).copyWith(
                        suffixIcon: Icon(
                          _capturedPhotoName != null ? Icons.check_circle_rounded : Icons.attach_file_rounded,
                          color: colorVerde,
                        ),
                      ),
                      validator: (value) => (value == null || value.isEmpty) ? 'Por favor, adjunta tu cédula' : null,
                    ),
                    const SizedBox(height: 15),

                    // Correo Electrónico
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: colorMarron),
                      decoration: _inputDecoration('Correo Electrónico', Icons.email_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Ingresa tu correo';
                        if (!RegExp(r'^[\w-\.]+\@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Correo no válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Contraseña
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: const TextStyle(color: colorMarron),
                      decoration: _inputDecoration('Contraseña', Icons.lock_outline_rounded).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: colorVerde,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      validator: (value) => (value == null || value.length < 6) ? 'Mínimo 6 caracteres' : null,
                    ),
                    const SizedBox(height: 25),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorDorado,
                        foregroundColor: colorCrema,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      onPressed: _submitRegister,
                      child: const Text('Registrarme ahora', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 25),

                    Row(
                      children: [
                        const Expanded(child: Divider(color: colorMarron, thickness: 1)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('¿Ya tienes una cuenta?', style: TextStyle(color: colorMarron, fontSize: 13)),
                        ),
                        const Expanded(child: Divider(color: colorMarron, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: colorVerde, width: 1.5),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Ir a Iniciar Sesión',
                        style: TextStyle(color: colorVerde, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: colorMarron),
      prefixIcon: Icon(icon, color: colorVerde),
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
    );
  }
}