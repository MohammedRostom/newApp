import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteUserDataSource {
  final FirebaseAuthServiceAbst firebaseAuthServiceAbs;

  RemoteUserDataSource({required this.firebaseAuthServiceAbs});

  /// ================= LOGIN =================
  Future<AuthUserModel> loginFromDataSource(
    String email,
    String password,
  ) async {
    return await firebaseAuthServiceAbs.signInWithEmail(
      email: email,
      password: password,
    );
  }

  /// ================= REGISTER =================
  Future<AuthUserModel> registrationFromDataSource(
    String username,
    String email,
    String password,
  ) async {
    return await firebaseAuthServiceAbs.signUpWithEmail(
      username: username,
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword(String email) async {
    await firebaseAuthServiceAbs.resetPassword(email);
  }

  Future<void> sendEmailVerification() async {
    await firebaseAuthServiceAbs.sendEmailVerification();
  }

  // Future<UserCredential> signInWithGoogleromDataSource() async {
  //   return await firebaseAuthServiceAbs.signInWithGoogle();
  // }

  /// ================= LOGOUT =================
  Future<void> logOutFromDataSource() async {
    await firebaseAuthServiceAbs.signOut();
  }
}
