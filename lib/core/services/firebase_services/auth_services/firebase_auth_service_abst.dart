import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthServiceAbst {
  Future<User?> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  });

  // Future<User?> signInAnonymously();

  Future<void> signOut();
  // Future<void> deleteAccount();
}
