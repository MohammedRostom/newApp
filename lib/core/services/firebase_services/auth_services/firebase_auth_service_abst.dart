import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

abstract class FirebaseAuthServiceAbst {
  Future<AuthUserModel> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });

  Future<AuthUserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<AuthUserModel> signInWithGoogle();
  Future<void> resetPassword(String email);
  Future<void> sendEmailVerification(String email);

  Future<void> signOut();
  // Future<void> deleteAccount();
}
