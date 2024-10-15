import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(AuthInitial()) {
    // Sign-up event handler
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading()); // Emit loading state
      try {
        // Call sign-up method from UserRepository and expect UserModel
        UserModel userModel =
            await _userRepository.signup(event.email, event.password);
        emit(SignupSuccess());
      } catch (e) {
        emit(SignupError(message: e.toString()));
      }
    });

    on<AuthLogin>((event, emit) async {
      emit(AuthLoading()); // Emit loading state
      try {
        // Call sign-up method from UserRepository and expect UserModel
        UserModel userModel =
            await _userRepository.login(event.email, event.password);

        // Emit Authenticated state with the UID from the userModel
        emit(AuthAuthenticated(user: userModel));
      } catch (e) {
        // Emit Unauthenticated state if something goes wrong
        emit(AuthUnauthenticated());
      }
    });
  }
}
