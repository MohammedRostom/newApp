import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServiceImpl extends FirebaseAuthServiceAbst {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreServiceAbst firebaseStore;

  FirebaseAuthServiceImpl({required this.firebaseStore});

  /// Sign up with email & password
  Future<User?> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
            try {
              // add to firestore
              firebaseStore.addAuthUserToFirestore(
                _auth.currentUser!.uid,
                username,
                email,
                Constant.CollectionUsers,
              );
            } catch (e) {
              // Handle Firestore error
              print('Error adding user to Firestore: $e');
            }
          });
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Login with email & password
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /// Delete account
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
