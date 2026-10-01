import 'package:flutter/material.dart';

class InicioTab extends StatelessWidget {
  const InicioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.monitor_weight, size: 80, color: Colors.greenAccent),
          SizedBox(height: 20),
          Text(
            'Bem-vindo ao Peso & Prato!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Navega pelas abas para veres os teus treinos e dietas.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}