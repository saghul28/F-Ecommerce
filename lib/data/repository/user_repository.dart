import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/data/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final AuthenticationService _apiService;

  UserRepository(this._apiService);

  // UserModel? getCurrentUser() {
  //   User? firebaseUser = _apiService.currentUser();
  //   if (firebaseUser != null) {
  //     return UserModel.fromFirebase(firebaseUser);
  //   }
  //   return null;
  // }

  Future<UserModel> signup(String email, String password) async {
    try {
      // Get UserModel from the service, no need to check for User object
      final UserModel? userModel = await _apiService.signup(email, password);
      if (userModel != null) {
        return userModel;
      } else {
        throw Exception('Signup failed: User is null');
      }
    } catch (e) {
      throw Exception(
          'Signup failed in repository: ${e.toString()}'); // Fixed the message
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final UserModel? userModel = await _apiService.login(email, password);
      if (userModel != null) {
        return userModel; // Return the entire UserModel
      } else {
        throw Exception('Login failed: UserModel is null');
      }
    } catch (e) {
      throw Exception('Login failed in UserRepository: $e');
    }
  }
}
