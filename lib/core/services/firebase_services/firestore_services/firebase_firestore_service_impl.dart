import 'package:auth_feature_1_0/core/errors/firebase_auth_errors.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServiceImpl extends FireStoreServiceAbst {
  // Implement Firestore methods here
  Future<bool> addAuthUserToFirestore({
    required String uid,
    required String username,
    required String email,
    required String CollectionName,
  }) async {
    try {
      AuthUserModel userModel = AuthUserModel(
        id: uid,
        email: email,
        username: username,
      );
      await FirebaseFirestore.instance
          .collection(CollectionName)
          .doc(userModel.id)
          .set(userModel.fromModeltoMap());
      print("User Added Successfully!");
      return true;
    } catch (e) {
      print("Error adding user to Firestore: $e");
      return false;
      //  في اصلاح هنا بتاعي on FirebaseException =================== متنساش
    }
  }

  @override
  Future<AuthUserModel?> getAuthUserFromFirestore({
    required String uid,
    required String collectionName,
  }) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(uid)
          .get();

      if (!doc.exists) return null;

      return AuthUserModel(
        id: doc['id'],
        email: doc['email'],
        username: doc['username'],
      );
    } on FirebaseException catch (e) {
      throw FirebaseAuthErrorMessages.getMessage(e.code);
    }
  }
}
