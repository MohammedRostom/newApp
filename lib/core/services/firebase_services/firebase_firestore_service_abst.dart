abstract class FireStoreServiceAbst {
  Future<bool> addAuthUserToFirestore(
    String uid,
    String username,
    String email,
    String CollectionName,
  );
}
