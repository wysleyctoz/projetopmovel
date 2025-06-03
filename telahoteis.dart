import 'package:flutter/material.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelScreen(),
    );
  }
}

class HotelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Hotéis'),
      ),
      body: ListView(
        children: [
          HotelCard(
            nome: 'Salinas Maceió All Inclusive Resort',
            preco: '2.301',
          ),
          HotelCard(
            nome: 'Pousada Mar Azul',
            preco: '1.540',
          ),
          HotelCard(
            nome: 'Hotel Praia Bonita',
            preco: '1.899',
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.person),
              SizedBox(width: 4),
              Text('Perfil'),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String nome;
  final String preco;

  HotelCard({required this.nome, required this.preco});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem simulada
          Container(
            height: 150,
            color: Colors.grey[300],
            child: Center(
              child: Icon(Icons.image, size: 50),
            ),
          ),
          SizedBox(height: 8),
          Text(
            nome,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('R\$ $preco'),
        ],
      ),
    );
  }