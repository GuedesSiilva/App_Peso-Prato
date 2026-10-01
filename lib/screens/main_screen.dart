import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
   const MainScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Main Screen'),
         centerTitle: true,
       ),
       body: Center(
         child: ElevatedButton(
           onPressed: () {
             // Navegar para a tela de login
             Navigator.pushNamed(context, '/login');
           },
           child: const Text('Ir para Login'),
         ),
       ),
     );
   }
 }