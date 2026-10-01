import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import 'editar_perfil_screen.dart'; // Importação do novo ecrã

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  void _fazerLogout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/Logo.png'),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 16),
          const Text(
            'Nome do Utilizador',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '@usuario_treino',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          const Text(
            'Focado em hipertrofia e alimentação equilibrada.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Navegação real para o EditarPerfilScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditarPerfilScreen()),
              );
            },
            icon: const Icon(Icons.edit, color: Colors.black),
            label: const Text('Editar Perfil', style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => _fazerLogout(context),
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            label: const Text('Sair da Conta', style: TextStyle(color: Colors.redAccent)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.redAccent),
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}