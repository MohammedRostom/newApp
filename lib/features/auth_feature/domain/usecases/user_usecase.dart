import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';

class UserUseCase {
  // dependency injection
  final RepositoryAbs repositoryAbs;
  UserUseCase({required this.repositoryAbs});

  Future<AuthUserEntity> loginCall(String email, String password) {
    return repositoryAbs.login(email, password);
  }

  Future<AuthUserEntity?> regiterCall(
    String username,
    String email,
    String password,
  ) {
    return repositoryAbs.registration(username, email, password);
  }

  // Future<AuthUserEntity?> signInWithGoogleFromUseCase() {
  //   return repositoryAbs.signInWithGoogle();
  // }
  Future<void> resetPasswordCall(String email) =>
      repositoryAbs.resetPassword(email);

  Future<void> sendEmailVerificationCall() =>
      repositoryAbs.sendEmailVerification();

  Future<void> logoutCall() {
    return repositoryAbs.logout();
  }
}
