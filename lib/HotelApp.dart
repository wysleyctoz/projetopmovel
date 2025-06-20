import 'package:flutter/material.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            Nome: 'Salinas Maceió All Inclusive Resort',
            preco: '2.301',
            imagem: 'assets/salinas.jpg',
          ),
          HotelCard(
            Nome: 'Pousada Mar Azul',
            preco: '1.545',
            imagem: 'assets/marazul.jpg',
          ),
          HotelCard(
            Nome: 'Hotel Praia Bonita',
            preco: '1.899',
            imagem: 'assets/praiabonita.jpg',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.green,
      ),
    );
  }
}


class HotelCard extends StatelessWidget {
  final String Nome;
  final String preco;
  final String imagem;


  HotelCard({
    required this.Nome,
    required this.preco,
    required this.imagem,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagem,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            Nome,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            'R\$ $preco',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
