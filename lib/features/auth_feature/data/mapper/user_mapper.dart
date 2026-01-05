import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

class UserMapper {
  static AuthUserEntity toEntity(AuthUserModel userModel) {
    return AuthUserEntity(
      id: userModel.id,
      username: userModel.username ?? userModel.email,
      email: userModel.email,
    );
  }
}
