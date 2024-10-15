import 'package:ecommerce/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserModel.fromFirebase(userCredential.user!);
    } catch (e) {
      throw Exception('Sign-up failed in AuthSevice: $e');
    }
  }

 Future<UserModel?> login(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Convert Firebase User to your UserModel
      return UserModel.fromFirebase(userCredential.user!);
    } catch (e) {
      // Log error message or handle it appropriately
      print('Login failed: $e');
      throw Exception('Login failed in AuthService: $e');
    }
  }

}
