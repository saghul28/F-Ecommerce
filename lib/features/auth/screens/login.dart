import 'package:ecommerce/features/auth/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/widgets/InputField.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              // Navigate to the next screen
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is AuthUnauthenticated) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Login failed in page. Please try again.')),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("Back", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 20,
                ),
                Inputfield(
                  fieldName: 'Username or email',
                  controller: _emailController,
                  icons: const Icon(Icons.person),
                  showPassword: false,
                ),
                const SizedBox(height: 15.0),
                Inputfield(
                    fieldName: 'password',
                    controller: _passwordController,
                    icons: const Icon(Icons.lock),
                    showPassword: true),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Aligns the button to the right
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forget password action
                      },
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.blue, // Customize the color as needed
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    context
                        .read<AuthBloc>()
                        .add(AuthLogin(email: email, password: password));
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
