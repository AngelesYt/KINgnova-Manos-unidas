import 'package:flutter/material.dart';

// Colores de la paleta de la aplicación
const Color colorVerde = Color(0xff0F8B8D);
const Color colorMarron = Color(0xff5C3A21);
const Color colorDorado = Color(0xffD4A017);
const Color colorCrema = Color(0xffF8F5F0);

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Estados para los controles de configuración
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _selectedLanguage = 'Español';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCrema,
      appBar: AppBar(
        backgroundColor: colorVerde,
        elevation: 0,
        title: const Text(
          'Configuración',
          style: TextStyle(color: colorCrema, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: colorCrema),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Preferencias de la Cuenta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorMarron,
            ),
          ),
          const SizedBox(height: 15),

          // Tarjeta contenedora de opciones
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xff5C3A21)),
            ),
            child: Column(
              children: [
                // Notificaciones
                SwitchListTile(
                  title: const Text(
                    'Notificaciones Push',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Recibe alertas de nuevos intercambios',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  secondary: const Icon(
                    Icons.notifications_active_outlined,
                    color: colorVerde,
                  ),
                  activeColor: Color(0xffD4A017),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                const Divider(height: 1, color: colorCrema),

                // Modo Oscuro (Visual)
                SwitchListTile(
                  title: const Text(
                    'Modo Oscuro',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Cambiar la apariencia visual',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  secondary: const Icon(
                    Icons.dark_mode_outlined,
                    color: colorVerde,
                  ),
                  activeColor: Color(0xffD4A017),
                  value: _darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
                const Divider(height: 1, color: colorCrema),

                // Selector de Idioma
                ListTile(
                  leading: const Icon(
                    Icons.language_rounded,
                    color: colorVerde,
                  ),
                  title: const Text(
                    'Idioma',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: DropdownButton<String>(
                    value: _selectedLanguage,
                    dropdownColor: colorCrema,
                    underline: const SizedBox(),
                    style: const TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.bold,
                    ),
                    items: <String>['Español', 'English', 'Português']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Text(
            'Seguridad y Legal',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorMarron,
            ),
          ),
          const SizedBox(height: 15),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xff5C3A21)),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.lock_reset_rounded,
                    color: colorVerde,
                  ),
                  title: const Text(
                    'Cambiar Contraseña',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorMarron,
                  ),
                  onTap: () {
                    // Acción para cambiar contraseña
                  },
                ),
                const Divider(height: 1, color: colorCrema),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: colorVerde,
                  ),
                  title: const Text(
                    'Política de Privacidad',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorMarron,
                  ),
                  onTap: () {
                    // Acción para ver políticas
                  },
                ),
                const Divider(height: 1, color: colorCrema),
                ListTile(
                  leading: const Icon(
                    Icons.info_outline_rounded,
                    color: colorVerde,
                  ),
                  title: const Text(
                    'Acerca de Manos Unidas',
                    style: TextStyle(
                      color: colorMarron,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorMarron,
                  ),
                  onTap: () {
                    // Acción de información de la app
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 35),

          // Botón de Cerrar Sesión
          OutlinedButton.styleFrom().runtimeType == ButtonStyle
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Lógica para cerrar sesión
                  },
                  child: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
