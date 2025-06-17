import 'package:flutter/material.dart';

void main() {
  runApp(const ReservaDeQuartosApp());
}

class ReservaDeQuartosApp extends StatelessWidget {
  const ReservaDeQuartosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Quartos',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const TelaReservaQuarto(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaReservaQuarto extends StatefulWidget {
  const TelaReservaQuarto({super.key});

  @override
  State<TelaReservaQuarto> createState() => _TelaReservaQuartoState();
}

class _TelaReservaQuartoState extends State<TelaReservaQuarto> {
  final TextEditingController _checkInController =
      TextEditingController(text: "01/07/2025");
  final TextEditingController _checkOutController =
      TextEditingController(text: "05/07/2025");
  final TextEditingController _guestsController =
      TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Reserva de Quartos do Hotel',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                buildDateField("Chegada", _checkInController),
                const SizedBox(height: 10),
                buildDateField("Saída", _checkOutController),
                const SizedBox(height: 10),
                buildGuestField(),
                const SizedBox(height: 20),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Reserva realizada!")),
                    );
                  },
                  child: const Text('Reservar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Este campo é apenas ilustrativo.")),
        );
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget buildGuestField() {
    return TextField(
      controller: _guestsController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Hóspedes",
        prefixIcon: const Icon(Icons.people, color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
