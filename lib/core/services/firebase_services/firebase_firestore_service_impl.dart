import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServiceImpl extends FireStoreServiceAbst {
  // Implement Firestore methods here

  Future<bool> addAuthUserToFirestore(
    uid,
    email,
    username,
    CollectionName,
  ) async {
    AuthUserEntity userEntity = AuthUserEntity(
      id: uid,
      email: email,
      username: username,
    );
    await FirebaseFirestore.instance
        .collection(CollectionName)
        .doc(userEntity.id)
        .set(userEntity.FromModeltoMap());
    print("User Added Successfully!");
    return true;
  }
}
