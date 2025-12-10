import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

class FireStoreServiceImpl extends FireStoreServiceAbst {
  // Implement Firestore methods here
  @override
  Future<bool> addAuthUserToFirestore(AuthUserEntity user) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.id)
        .set(user.toMap());
    print("User Added Successfully!");
    return true;
  }
}
