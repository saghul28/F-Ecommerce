import 'package:ecommerce/common/startingslider.dart';
import 'package:ecommerce/common/themes.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:ecommerce/data/services/authentication_service.dart';
import 'package:ecommerce/features/auth/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/screens/home.dart';
import 'package:ecommerce/features/auth/screens/login.dart';
import 'package:ecommerce/features/auth/screens/signup.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/firebase_options.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(UserRepository(AuthenticationService())),
      child: MaterialApp(
        title: 'E-commerce App',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
        routes: {
          // '/': (context) =>
          //     const SignUpScreen(), // Initial screen (e.g., Sign Up)
          '/home': (context) => const HomeScreen(), // Route to HomeScreen
          '/login': (context) => const LoginScreen()
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      childWidget: Center(
        child: Image.asset("images/logo.png"),
      ),
      nextScreen: const Startingslider(),
      duration: const Duration(milliseconds: 3000),
    );
  }
}
