import 'package:ecommerce/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print("Current Auth State: $state"); // Debug statement

          if (state is AuthAuthenticated) {
            return Center(
              child: Text('Welcome, ${state.user.email}!'), // Access user email
            );
          } else if (state is AuthUnauthenticated) {
            return const Center(
              child: Text('Please log in.'),
            );
          } else if (state is AuthLoading) {
            return const Center(
                child: CircularProgressIndicator()); // Handle loading state
          } else {
            return const Center(
                child:
                    Text('Unknown state.')); // Fallback case for other states
          }
        },
      ),
    );
  }
}
