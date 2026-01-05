import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/mapper/user_mapper.dart';

class RepositoryImpl extends RepositoryAbs {
  final RemoteUserDataSource remoteUserDataSource;

  RepositoryImpl({required this.remoteUserDataSource});

  @override
  Future<AuthUserEntity> login(String email, String password) async {
    final model = await remoteUserDataSource.loginFromDataSource(
      email,
      password,
    );
    return UserMapper.toEntity(model); // mapper Apply
  }

  @override
  Future<AuthUserEntity?> registration(
    String username,
    String email,
    String password,
  ) async {
    final model = await remoteUserDataSource.registrationFromDataSource(
      username,
      email,
      password,
    );
    return UserMapper.toEntity(model);
  }

  @override
  Future<void> logout() async {
    await remoteUserDataSource.logOutFromDataSource();
  }
}
