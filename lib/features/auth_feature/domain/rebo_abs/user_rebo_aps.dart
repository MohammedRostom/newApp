import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

abstract class RepositoryAbs {
  Future<AuthUserEntity> login(String email, String password);
  Future<AuthUserEntity?> registration(
    String username,
    String email,
    String password,
  );
  Future<AuthUserEntity> signInWithGoogle();
  Future<void> resetPassword(String email);
  Future<void> sendEmailVerification(String email);
  Future<void> logout();
}
