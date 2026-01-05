import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/errors/firebase_auth_errors.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServiceImpl extends FirebaseAuthServiceAbst {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreServiceAbst firebaseStore;

  FirebaseAuthServiceImpl({required this.firebaseStore});

  /// ================= SIGN UP =================
  @override
  Future<AuthUserModel> signUpWithEmail({
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

      final model = AuthUserModel.fromMapToModel(
        user,
        username,
      ); // parsing from USer to AuthUserModel

      await firebaseStore.addAuthUserToFirestore(
        username,
        email,
        user.uid,
        Constant.CollectionUsers,
      );

      return model;
    } on FirebaseAuthException catch (e) {
      return Future.error(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }

  /// ================= SIGN IN =================
  @override
  Future<AuthUserModel> signInWithEmail({
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

      return AuthUserModel.fromMapToModel(user);
    } on FirebaseAuthException catch (e) {
      return Future.error(FirebaseAuthErrorMessages.getMessage(e.code));
    }
  }

  /// ================= ANONYMOUS =================
  @override
  Future<AuthUserModel> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();

      final user = userCredential.user;
      if (user == null) {
        throw Exception('فشل الدخول كضيف');
      }

      return AuthUserModel.fromMapToModel(user);
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
