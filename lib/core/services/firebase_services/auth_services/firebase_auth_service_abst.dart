import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // Future<User?> signInAnonymously();

  Future<void> signOut();
  // Future<void> deleteAccount();
}
