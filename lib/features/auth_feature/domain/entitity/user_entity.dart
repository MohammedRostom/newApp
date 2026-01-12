class AuthUserEntity {
  final String _id;
  String? _username;
  final String _email;

  AuthUserEntity({required String id, String? username, required String email})
    : _id = id,
      _username = username,
      _email = email;

  String get id => _id;
  String get email => _email;
  String? get username => _username ?? _email;
  //applay encapsualtion Done
}
