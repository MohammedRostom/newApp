class AuthUserEntity {
  final String _id;
  final String _email;
  final String _username;

  AuthUserEntity({
    required String id,
    required String email,
    required String username,
  }) : _id = id,
       _email = email,
       _username = username;

  String get id => _id;
  String get email => _email;
  String get username => _username;
  //applay encapsualtion Done

  // 🔥 تحويل الـ class إلى خريطة (Map)
  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "email": _email,
      "username": _username,
      "createdAt": DateTime.now().toIso8601String(),
    };
  }
}
