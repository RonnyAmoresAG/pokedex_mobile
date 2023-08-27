import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokedex_mobile/providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Usuario'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Clave'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Iniciar Sesión'),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, complete todos los campos')),
                  );
                  return;
                }
                final loginProvider =
                    Provider.of<LoginProvider>(context, listen: false);
                loginProvider.login(email, password).then((_) {
                  if (loginProvider.user != null) {
                    Navigator.of(context).pushReplacementNamed('/');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error al iniciar sesión')),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
