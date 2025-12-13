import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

class RepositoryImpl extends RepositoryAbs {
  final RemoteUserDataSource remoteUserDataSource;

  RepositoryImpl({required this.remoteUserDataSource});

  @override
  Future<AuthUserEntity> login(String email, String password) async {
    final user = await remoteUserDataSource.loginFromDataSource(
      email,
      password,
    );
    final AuthUserEntity userEntity = AuthUserModel.fromMapToModel(user!);
    return userEntity;
  }

  @override
  Future<AuthUserEntity?> registration(
    String username,
    String email,
    String password,
  ) async {
    final user = await remoteUserDataSource.registrationFromDataSource(
      username,
      email,
      password,
    );
    final AuthUserEntity userEntity = AuthUserModel.fromMapToModel(user!);
    return userEntity;
  }

  @override
  Future<void> logout() async {
    await remoteUserDataSource.logOutFromDataSource();
  }
}
