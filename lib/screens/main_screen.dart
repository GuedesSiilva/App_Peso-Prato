import 'package:flutter/material.dart';
import 'tabs/inicio_tab.dart';
import 'tabs/dietas_tab.dart';
import 'tabs/treinos_tab.dart';
import 'tabs/perfil_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indiceAtual = 0;

  // Lista dos ecrãs que vão aparecer em cada aba
  final List<Widget> _telas = [
    const Center(child: Text('Ecrã de Início (Resumo)')), // Substituir por InicioTab() quando implementares
    const Center(child: Text('Ecrã de Dietas')),         // Substituir por DietasTab()
    const Center(child: Text('Ecrã de Treinos')),        // Substituir por TreinosTab()
    const PerfilTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peso & Prato'),
        centerTitle: true,
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1E1E1E),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Dietas'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Treinos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}