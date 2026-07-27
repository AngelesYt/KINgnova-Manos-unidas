import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String? title;
  const ReportCard({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title ?? 'Reportes Recientes',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Usuario')),
                DataColumn(label: Text('Tipo')),
                DataColumn(label: Text('Descripción')),
                DataColumn(label: Text('Estado')),
                DataColumn(label: Text('Acciones')),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('#R001')),
                    const DataCell(Text('María López')),
                    const DataCell(Text('Producto')),
                    const DataCell(Text('Producto duplicado en marketplace.')),
                    const DataCell(Text('Pendiente')),
                    DataCell(
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Revisar'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Resolver',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('#R002')),
                    const DataCell(Text('Carlos Pérez')),
                    const DataCell(Text('Usuario')),
                    const DataCell(Text('Comportamiento inapropiado en chat.')),
                    const DataCell(Text('En revisión')),
                    DataCell(
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Revisar'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Bloquear',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
