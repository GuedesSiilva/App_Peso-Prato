import 'package:flutter/material.dart';

class DietasTab extends StatelessWidget {
  const DietasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _construirCardDieta('Pequeno-almoço', 'Ovos mexidos com pão integral e café', Icons.breakfast_dining),
        _construirCardDieta('Almoço', 'Frango grelhado com arroz e salada', Icons.lunch_dining),
        _construirCardDieta('Jantar', 'Sopa de legumes e peixe assado', Icons.dinner_dining),
      ],
    );
  }

  Widget _construirCardDieta(String refeicao, String descricao, IconData icone) {
    return Card(
      color: const Color(0xFF2C2C2C),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icone, color: Colors.greenAccent, size: 40),
        title: Text(refeicao, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(descricao, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}