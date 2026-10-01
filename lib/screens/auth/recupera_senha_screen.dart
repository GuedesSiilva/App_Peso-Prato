import 'package:flutter/material.dart';

class RecuperaSenha extends StatefulWidget {
   const RecuperaSenha({super.key});

   @override
   State<RecuperaSenha> createState() => _RecuperaSenhaState();
 }

 class _RecuperaSenhaState extends State<RecuperaSenha> {
   final TextEditingController _emailController = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Recuperar Senha'),
       ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextField(
               controller: _emailController,
               decoration: const InputDecoration(
                 labelText: 'Email',
               ),
             ),
             const SizedBox(height: 20),
             ElevatedButton(
               onPressed: () {
                 // Lógica para recuperar a senha
                 String email = _emailController.text;
                 // Aqui você pode adicionar a lógica para enviar o email de recuperação
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text('Email de recuperação enviado para $email')),
                 );
               },
               child: const Text('Enviar Email de Recuperação'),
             ),
           ],
         ),
       ),
     );
   }
 }