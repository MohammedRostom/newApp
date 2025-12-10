import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteUserDataSource {
  final FirebaseAuthServiceAbst firebaseAuthServiceAbs;
  RemoteUserDataSource({required this.firebaseAuthServiceAbs});

  Future<User?> LoginFromDataSource(String email, String password) async {
    try {
      final User? user = await firebaseAuthServiceAbs.signInWithEmail(
        email: email,
        password: password,
      );
      if (user != null) {
        return user;
      }
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  Future<User?> RegistrationFromDataSource(
    String username,
    String email,
    String password,
  ) async {
    try {
      final User? user = await firebaseAuthServiceAbs.signUpWithEmail(
        username: username,
        email: email,
        password: password,
      );
      if (user != null) {
        return user;
      }
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }

  Future<void> LogOutFromDataSource() async {
    return await firebaseAuthServiceAbs.signOut();
  }
}
