import 'package:flutter/material.dart';
import 'package:learing_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            ValueListenableBuilder(
              builder: (context, value, _) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () {
                        obscure.value = !obscure.value;
                      },
                      child: Icon(
                        value ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                );
              },
              valueListenable: obscure,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  loginProvider.login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
