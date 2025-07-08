import 'package:flutter/material.dart'; 
void main() {
  runApp(const ReservaDeQuartosApp());
} 

// Widget principal do aplicativo
class ReservaDeQuartosApp extends StatelessWidget {
  const ReservaDeQuartosApp({super.key}); // Construtor com super.key (super. key é usado para passar a chave para a classe pai (StatelessWidget ou StatefulWidget
  //StatelessWidget é usado para elementos estáticos da interface do usuário que não precisam ser atualizados após a criação, enquanto StatefulWidget 
 // é usado para elementos dinâmicos que podem mudar seu estado em resposta a eventos ou interações do usuário. ),
   // ajudando o Flutter a gerenciar atualizações de IU com eficiência.) para identificação do widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Quartos', // Título do app
      theme: ThemeData(primarySwatch: Colors.green), // Define o tema de cor verde
      home: const TelaReservaQuarto(), // Tela inicial do aplicativo
      debugShowCheckedModeBanner: false, // Remover aquela faixa "debug" da interface da tela que fica na borda
    );
  }
}

// Tela principal das reservas
class TelaReservaQuarto extends StatefulWidget {
  const TelaReservaQuarto({super.key});

  @override
  State<TelaReservaQuarto> createState() => _TelaReservaQuartoState(); // Cria o estado da tela em que 
  // ela é Stateful que significa que ela não vai mudar o estado dela 
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
      backgroundColor: Colors.green.shade100, // Cor de fundo verde
      body: SafeArea( // Garante que o conteúdo não fique sob a barra superior
        child: Center( // Centraliza o conteúdo da tela deixando ele no centro dela
          child: Container( // Container que vai deixar como se fosse a Caixa que envolve os campos de texto 
          e os  botões
            margin: const EdgeInsets.all(20), // Espaço externo
            padding: const EdgeInsets.all(20), // Espaço interno
            decoration: BoxDecoration(
              color: Colors.white, // Fundo do container que é branco
              borderRadius: BorderRadius.circular(20), //  Aqui é para deixar os Cantos arredondados para dar uma
              // diferença no container
            ),
            child: Column( // Organizar os elementos na vertical
              mainAxisSize: MainAxisSize.min, // A coluna só ocupa o espaço necessário
              children: [
                const Text(
                  'Reserva de Quartos do Hotel',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento

                // Campo de texto responsavel pela data de chegada
                buildDateField("Chegada", _checkInController),

                const SizedBox(height: 10), // Espaçamento

                // Campo de texto responsavel pela data de saída
                buildDateField("Saída", _checkOutController),

                const SizedBox(height: 10), // Espaçamento

                // Campo de texto responsavel pela quantidade de hóspedes
                buildGuestField(),

                const SizedBox(height: 20), // Ultimo Espaçamento 

                // Botão de reservar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green), // Cor verde
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar( 
                      //Mesmo chamado de que utiliza para indicar que é um campo ilustratuvo so que nesse é da confirmação da reserva
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

  // Método que constrói os campos de data (chegada e saída)
  Widget buildDateField(String label, TextEditingController controller) {
    return TextField(
      controller: controller, // Controlador que guarda o valor do campo
      readOnly: true, // Campo somente leitura
      onTap: () => _showInfoSnackBar(context), // Ao tocar, mostra mensagem
      decoration: InputDecoration(
        labelText: label, // Nome do campo (Chegada ou Saída)
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.red), 
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
        prefixIcon: const Icon(Icons.people, color: Colors.black), 
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Borda arredondada
      ),
    );
  }
}
