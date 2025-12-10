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
}
