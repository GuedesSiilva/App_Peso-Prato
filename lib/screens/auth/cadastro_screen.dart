import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _nomeController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  bool _ocultarSenha = true;

  void _realizarCadastro() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Insira seu nome' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nome de usuário',
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Insira um nome de usuário' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Insira seu e-mail';
                    if (!value.contains('@')) return 'E-mail inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _senhaController,
                  obscureText: _ocultarSenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_ocultarSenha ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _ocultarSenha = !_ocultarSenha),
                    ),
                  ),
                  validator: (value) => value != null && value.length < 6 ? 'Mínimo de 6 caracteres' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _confirmaSenhaController,
                  obscureText: _ocultarSenha,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Senha',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Confirme sua senha';
                    if (value != _senhaController.text) return 'As senhas não coincidem';
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: _realizarCadastro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black, // Texto preto para melhor leitura
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'CADASTRAR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Já tem uma conta? Voltar ao Login', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}