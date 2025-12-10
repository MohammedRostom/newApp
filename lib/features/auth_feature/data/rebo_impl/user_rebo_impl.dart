import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

class RepositoryImpl extends RepositoryAbs {
  final RemoteUserDataSource remoteUserDataSource;

  RepositoryImpl({required this.remoteUserDataSource});

  @override
  Future<AuthUserEntity> login(String email, String password) async {
    try {
      final user = await remoteUserDataSource.LoginFromDataSource(
        email,
        password,
      );
      final AuthUserEntity userEntity = await AuthUserModel.fromMapToModel(
        user!,
      );
      print("login FromRemoteDataSourse=========> email :${userEntity.email}");
      return userEntity;
    } catch (e) {
      print("Error during login: $e");
      rethrow; // Optionally rethrow the error if needed
    }
  }

  @override
  Future<AuthUserEntity?> registration(
    String username,
    String email,
    String password,
  ) async {
    try {
      final user = await remoteUserDataSource.RegistrationFromDataSource(
        username,
        email,
        password,
      );
      final AuthUserEntity userEntity = await AuthUserModel.fromMapToModel(
        user!,
        username,
      );
      print(
        "Registration FromRemoteDataSourse=========> email :${userEntity.email}",
      );
      return userEntity;
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await remoteUserDataSource.LogOutFromDataSource();
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
