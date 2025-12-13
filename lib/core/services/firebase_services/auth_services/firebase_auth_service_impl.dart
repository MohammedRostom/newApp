import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/errors/firebase_auth_errors.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServiceImpl extends FirebaseAuthServiceAbst {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreServiceAbst firebaseStore;

  FirebaseAuthServiceImpl({required this.firebaseStore});

  /// ================= SIGN UP =================
  @override
  Future<User> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('فشل إنشاء المستخدم');
      }

      await firebaseStore.addAuthUserToFirestore(
        user.uid,
        username,
        email,
        Constant.CollectionUsers,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      print("frrrrrrrrrrrrrrrrrrrrrrm =========>${e.toString()}");
      return Future.error(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }

  /// ================= SIGN IN =================
  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('فشل تسجيل الدخول');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      print("frrrrrrrrrrrrrrrrrrrrrrm =========>${e.toString()}");
      return Future.error(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }

  /// ================= ANONYMOUS =================
  @override
  Future<User> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();

      final user = userCredential.user;
      if (user == null) {
        throw Exception('فشل الدخول كضيف');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      return Future.error(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }

  /// ================= LOGOUT =================
  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (_) {
      throw Exception('فشل تسجيل الخروج');
    }
  }

  /// ================= DELETE ACCOUNT =================
  @override
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('لا يوجد مستخدم');
      }

      await user.delete();
    } on FirebaseAuthException catch (e) {
      throw Exception(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }
}
