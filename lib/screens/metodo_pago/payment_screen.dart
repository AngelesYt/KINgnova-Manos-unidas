import 'package:flutter/material.dart';

import '../../services/app_flow.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Método de pago seleccionado por defecto
  String _selectedPaymentMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de Pago'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona cómo deseas pagar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Opción 1: Tarjeta de Crédito/Débito
            _buildPaymentOption(
              value: 'card',
              title: 'Tarjeta de Crédito / Débito',
              subtitle: 'Visa, Mastercard, American Express',
              icon: Icons.credit_card,
            ),

            // Opción 2: Pago Móvil / Digital (ej. bKash / PayPal / Transferencia)
            _buildPaymentOption(
              value: 'digital_wallet',
              title: 'Billetera Digital / Transferencia',
              subtitle: 'Pago rápido y seguro en línea',
              icon: Icons.account_balance_wallet,
            ),

            // Opción 3: Pago contra entrega
            _buildPaymentOption(
              value: 'cash',
              title: 'Pago contra entrega',
              subtitle: 'Paga al recibir el producto',
              icon: Icons.money,
            ),

            const Spacer(),

            // Botón de Confirmar Pago
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => AppFlow.goTo(
                  context,
                  AppFlow.profile,
                  data: {'metodo_pago': _selectedPaymentMethod},
                ),
                child: const Text(
                  'Continuar con el Pago',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir cada opción de pago de forma limpia
  Widget _buildPaymentOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: RadioListTile<String>(
        value: value,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? newValue) {
          setState(() {
            _selectedPaymentMethod = newValue!;
          });
        },
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        secondary: Icon(icon, color: Colors.blue, size: 30),
        activeColor: Colors.blue,
      ),
    );
  }
}
