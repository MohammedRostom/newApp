import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

abstract class FireStoreServiceAbst {
  Future<bool> addAuthUserToFirestore({
    required String uid,
    required String username,
    required String email,
    required String CollectionName,
  });
  Future<AuthUserModel?> getAuthUserFromFirestore({
    required String uid,

    required String collectionName,
  });
}
