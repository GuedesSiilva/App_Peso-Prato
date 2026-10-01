import 'package:flutter/material.dart';

class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores já iniciados com dados de exemplo
  final _nomeController = TextEditingController(text: 'Nome do Utilizador');
  final _usuarioController = TextEditingController(text: 'usuario_treino');
  final _bioController = TextEditingController(text: 'Focado em hipertrofia e alimentação equilibrada.');

  void _guardarPerfil() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados atualizados com sucesso!'), backgroundColor: Colors.green),
      );
      Navigator.pop(context); // Volta ao perfil
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'O nome não pode estar vazio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _usuarioController,
                decoration: const InputDecoration(labelText: 'Nome de Utilizador', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'O nome de utilizador não pode estar vazio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Biografia', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _guardarPerfil,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('GUARDAR ALTERAÇÕES', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}