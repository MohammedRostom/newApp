import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

abstract class FireStoreServiceAbst {
  Future<bool> addAuthUserToFirestore(AuthUserEntity user);
}
