import 'package:ecommerce/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            const CircularProgressIndicator();
          } else if (state is SignupSuccess) {
            // Navigate to the next screen after successful sign-up
            Navigator.pushReplacementNamed(
                context, '/login'); // Change this to your home screen
          } else if (state is SignupError) {
            // Show an error message or Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Sign-up failed. Please try again.')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Dispatch sign-up event
                    BlocProvider.of<AuthBloc>(context).add(
                      AuthSignUp(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  child: const Text('Sign Up'),
                ),
                if (state is AuthLoading)
                  const CircularProgressIndicator(), // Show loading indicator
              ],
            ),
          );
        },
      ),
    );
  }
}
