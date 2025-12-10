import 'package:auth_feature_1_0/core/services/firebase_services/firebase_auth_service_abst.dart';

class RemoteUserDataSource {
  final FirebaseAuthServiceAbst firebaseAuthServiceAbs;
  RemoteUserDataSource({required this.firebaseAuthServiceAbs});
}
