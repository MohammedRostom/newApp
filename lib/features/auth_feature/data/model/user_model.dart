import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({
    required super.id,
    required super.email,
    required super.username,
  });

  Map<String, dynamic> FromModeltoMap() {
    return {
      "createdAt": DateTime.now().toIso8601String(),
      "id": id,
      "username": username,
      "email": email,
    };
  }
}
