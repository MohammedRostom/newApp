import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';

class UserUseCase {
  // dependency injection
  final RepositoryAbs repositoryAbs;
  UserUseCase({required this.repositoryAbs});

  Future<AuthUserEntity> loginFromUseCase(String email, String password) {
    return repositoryAbs.login(email, password);
  }

  Future<AuthUserEntity?> signInWithGoogleFromUseCase() {
    return repositoryAbs.signInWithGoogle();
  }

  Future<void> resetPasswordFromUseCase(String email) {
    return repositoryAbs.resetPassword(email);
  }

  Future<void> sendEmailVerificationFromUseCase(String email) {
    return repositoryAbs.sendEmailVerification(email);
  }

  Future<void> logoutFromUseCase() {
    return repositoryAbs.logout();
  }
}
