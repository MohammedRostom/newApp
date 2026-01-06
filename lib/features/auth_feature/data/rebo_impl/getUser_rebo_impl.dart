import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/getUser_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/getUser_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/mapper/user_mapper.dart';

class GetRepositoryImpl extends GetUserReboAps {
  @override
  final GetUserDatasource remoteUserDataSource;

  GetRepositoryImpl({required this.remoteUserDataSource});
  Future<AuthUserEntity?> getUser(String uid, String collectionName) async {
    final model = await remoteUserDataSource.getUserFromDataSource(
      uid,
      collectionName,
    );
    return UserMapper.toEntity(model!);
  }
}
