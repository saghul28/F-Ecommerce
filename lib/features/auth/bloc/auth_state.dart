part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

// login
final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel user; // Change uid to user of type UserModel

  AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

// signup

final class SignUpLoading extends AuthState {}

class SignupSuccess extends AuthState {}

class SignupError extends AuthState {
  final String message;
  SignupError({required this.message});
}
