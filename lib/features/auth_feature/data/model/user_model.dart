import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserModel extends AuthUserEntity {
  final String? photoUrl;
  final bool? isAnonymous;
  AuthUserModel({
    this.photoUrl,
    this.isAnonymous,
    required super.id,
    super.username,
    required super.email,
  });

  // من Map (Firestore مثلاً)
  factory AuthUserModel.fromMapToModel(User user, [String? username]) {
    return AuthUserModel(
      isAnonymous: user.isAnonymous,
      photoUrl: user.photoURL,
      id: user.uid,
      email: user.email!,
      username: username,
    );
  }

  Map<String, dynamic> fromModeltoMap() {
    return {
      "createdAt": DateTime.now().toIso8601String(),
      "id": id,
      "username": username,
      "email": email,
    };
  }
}
