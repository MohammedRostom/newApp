import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

abstract class RepositoryAbs {
  Future<AuthUserEntity> login(String email, String password);
  Future<AuthUserEntity?> registration(
    String username,
    String email,
    String password,
  );
  Future<void> logout();
}
