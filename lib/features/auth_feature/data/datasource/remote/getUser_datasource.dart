import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/model/user_model.dart';

class GetUserDatasource {
  final FireStoreServiceAbst fireStoreService;

  GetUserDatasource({required this.fireStoreService});

  Future<AuthUserModel?> getUserFromDataSource(
    String uid,
    String collectionName,
  ) async {
    return await fireStoreService.getAuthUserFromFirestore(
      uid: uid,
      collectionName: collectionName,
    );
  }
}
