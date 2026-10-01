import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const MeuAppAcademia());
}

class MeuAppAcademia extends StatelessWidget {
  const MeuAppAcademia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peso & Prato',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Fundo Grafite
        primaryColor: Colors.greenAccent,
        colorScheme: const ColorScheme.dark(
          primary: Colors.greenAccent,
          secondary: Colors.lightGreenAccent,
          surface: Color(0xFF2C2C2C), // Cor dos cards (um cinza sutilmente mais claro)
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}