import 'package:flutter/material.dart';

class TreinosTab extends StatefulWidget {
  const TreinosTab({super.key});

  @override
  State<TreinosTab> createState() => _TreinosTabState();
}

class _TreinosTabState extends State<TreinosTab> {
  // Lista dinâmica que armazena os treinos (Funcionalidade Principal)
  final List<String> _treinos = ['Treino A - Peito e Tríceps', 'Treino B - Costas e Bíceps'];
  final _formKey = GlobalKey<FormState>();
  final _treinoController = TextEditingController();

  void _adicionarTreino() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _treinos.add(_treinoController.text);
      });
      _treinoController.clear();
      Navigator.pop(context); // Fecha o modal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Treino adicionado com sucesso!'), backgroundColor: Colors.green),
      );
    }
  }

  void _abrirModalAdicionar() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text('Novo Treino', style: TextStyle(color: Colors.white)),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _treinoController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Nome do Treino (ex: Treino C - Pernas)',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value!.isEmpty ? 'Insira um nome válido' : null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: _adicionarTreino,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
            child: const Text('Guardar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _treinos.isEmpty
          ? const Center(child: Text('Nenhum treino registado. Adiciona o primeiro!'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _treinos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF2C2C2C),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center, color: Colors.greenAccent),
                    title: Text(_treinos[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        setState(() => _treinos.removeAt(index));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Treino removido!'), backgroundColor: Colors.redAccent),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirModalAdicionar,
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}