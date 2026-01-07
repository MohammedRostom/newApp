import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/mapper/user_mapper.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // @override
  // Future<AuthUserEntity> signInWithGoogle() async {
  //   final userCredential = await remoteUserDataSource
  //       .signInWithGoogleromDataSource();
  //   final model = AuthUserModel(
  //     id: userCredential.user!.uid,
  //     email: userCredential.user!.email!,
  //     username: userCredential.user!.email!,
  //   );

  //   return UserMapper.toEntity(model);
  // }

  @override
  Future<void> resetPassword(String email) async {
    await remoteUserDataSource.resetPassword(email);
  }

  @override
  Future<void> sendEmailVerification() async {
    await remoteUserDataSource.sendEmailVerification();
  }

  @override
  Future<void> logout() async {
    await remoteUserDataSource.logOutFromDataSource();
  }
}
