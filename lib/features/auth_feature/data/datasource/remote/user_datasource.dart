import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteUserDataSource {
  final FirebaseAuthServiceAbst firebaseAuthServiceAbs;
  RemoteUserDataSource({required this.firebaseAuthServiceAbs});

  Future<User?> loginFromDataSource(String email, String password) async {
    final User? user = await firebaseAuthServiceAbs.signInWithEmail(
      email: email,
      password: password,
    );
    return user;
  }

  Future<User?> registrationFromDataSource(
    String username,
    String email,
    String password,
  ) async {
    final User? user = await firebaseAuthServiceAbs.signUpWithEmail(
      username: username,
      email: email,
      password: password,
    );
    return user;
  }

  Future<void> logOutFromDataSource() async {
    await firebaseAuthServiceAbs.signOut();
  }
}
