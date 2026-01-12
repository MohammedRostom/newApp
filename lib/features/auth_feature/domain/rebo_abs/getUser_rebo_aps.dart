import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

abstract class GetUserReboAps {
  Future<AuthUserEntity?> getUser(String uid, String collectionName);
}
