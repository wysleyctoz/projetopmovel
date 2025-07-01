import 'package:flutter/material.dart'; // Importa o pacote principal do Flutter para usar componentes visuais

void main() {
  runApp(const ReservaDeQuartosApp()); // Função principal que inicia o app chamando o widget principal
}

// Widget principal do aplicativo
class ReservaDeQuartosApp extends StatelessWidget {
  const ReservaDeQuartosApp({super.key}); // Construtor com super.key para identificação do widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Quartos', // Título do app (visível em algumas plataformas)
      theme: ThemeData(primarySwatch: Colors.green), // Define o tema de cor verde
      home: const TelaReservaQuarto(), // Tela inicial do aplicativo
      debugShowCheckedModeBanner: false, // Remove a faixa "debug" da interface
    );
  }
}

// Tela principal da reserva de quartos
class TelaReservaQuarto extends StatefulWidget {
  const TelaReservaQuarto({super.key});

  @override
  State<TelaReservaQuarto> createState() => _TelaReservaQuartoState(); // Cria o estado da tela
}

class _TelaReservaQuartoState extends State<TelaReservaQuarto> {
  // Controladores para os campos de texto
  final TextEditingController _checkInController = TextEditingController(text: "01/07/2025");
  final TextEditingController _checkOutController = TextEditingController(text: "05/07/2025");
  final TextEditingController _guestsController = TextEditingController(text: "1");

  // Função chamada quando o usuário toca em um campo de data
  // Mostra uma mensagem dizendo que é apenas ilustrativo
  void _showInfoSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Este campo é apenas ilustrativo."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estrutura básica da tela
      backgroundColor: Colors.green.shade100, // Cor de fundo clara (verde)
      body: SafeArea( // Garante que o conteúdo não fique sob o notch ou barra superior
        child: Center( // Centraliza o conteúdo da tela
          child: Container( // "Caixa" que envolve os campos e botões
            margin: const EdgeInsets.all(20), // Espaço externo
            padding: const EdgeInsets.all(20), // Espaço interno
            decoration: BoxDecoration(
              color: Colors.white, // Fundo branco
              borderRadius: BorderRadius.circular(20), // Cantos arredondados
            ),
            child: Column( // Organiza os elementos na vertical
              mainAxisSize: MainAxisSize.min, // A coluna só ocupa o espaço necessário
              children: [
                const Text( // Título da tela
                  'Reserva de Quartos do Hotel',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento

                // Campo de data de chegada
                buildDateField("Chegada", _checkInController),

                const SizedBox(height: 10), // Espaçamento

                // Campo de data de saída
                buildDateField("Saída", _checkOutController),

                const SizedBox(height: 10), // Espaçamento

                // Campo de quantidade de hóspedes
                buildGuestField(),

                const SizedBox(height: 20), // Espaçamento final

                // Botão de reserva
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Estilo verde
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar( // Exibe confirmação
                      const SnackBar(content: Text("Reserva realizada!")),
                    );
                  },
                  child: const Text('Reservar'), // Texto do botão
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método que constrói os campos de data (chegada e saída)
  Widget buildDateField(String label, TextEditingController controller) {
    return TextField(
      controller: controller, // Controlador que guarda o valor do campo
      readOnly: true, // Campo somente leitura
      onTap: () => _showInfoSnackBar(context), // Ao tocar, mostra mensagem
      decoration: InputDecoration(
        labelText: label, // Nome do campo (Chegada ou Saída)
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.red), // Ícone de calendário
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Borda arredondada
      ),
    );
  }

  // Método que constrói o campo de quantidade de hóspedes
  Widget buildGuestField() {
    return TextField(
      controller: _guestsController, // Controlador para número de hóspedes
      keyboardType: TextInputType.number, // Abre teclado numérico
      decoration: InputDecoration(
        labelText: "Hóspedes", // Rótulo do campo
        prefixIcon: const Icon(Icons.people, color: Colors.black), // Ícone de pessoas
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Borda arredondada
      ),
    );
  }
}
