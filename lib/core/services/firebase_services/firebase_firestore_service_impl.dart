import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServiceImpl extends FireStoreServiceAbst {
  // Implement Firestore methods here

  Future<bool> addAuthUserToFirestore(
    uid,
    username,
    email,
    CollectionName,
  ) async {
    AuthUserModel userModel = AuthUserModel(
      id: uid,
      email: email,
      username: username,
    );
    await FirebaseFirestore.instance
        .collection(CollectionName)
        .doc(userModel.id)
        .set(userModel.FromModeltoMap());
    print("User Added Successfully!");
    return true;
  }
}
