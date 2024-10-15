part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  AuthLogin({required this.email, required this.password});
}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  
  AuthSignUp({
    required this.email,
    required this.password,
   
  });
}

class AuthCheck extends AuthEvent {}

class AuthLogut extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
