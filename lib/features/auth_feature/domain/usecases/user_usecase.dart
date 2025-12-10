import 'package:auth_feature_1_0/features/auth_feature/domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/domain/rebo_abs/rebo_abs.dart';

abstract class UserUseCase {
  final RepositoryAbs repositoryAbs;
  UserUseCase(this.repositoryAbs);

  Future<AuthUserEntity> loginFromUseCase(String email, String password) {
    return repositoryAbs.login(email, password);
  }

  Future<AuthUserEntity> registrationFromUseCase(
    String username,
    String email,
    String password,
  ) {
    return repositoryAbs.registration(username, email, password);
  }

  Future<void> logoutFromUseCase() {
    return repositoryAbs.logout();
  }
}
