import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/getUser_rebo_aps.dart';

class GetUserUsecase {
  final GetUserReboAps getUserReboAps;

  GetUserUsecase({required this.getUserReboAps});

  Future<AuthUserEntity?> GetUserFromUseCase(
    String uid,
    String collectionName,
  ) async {
    return await getUserReboAps.getUser(uid, collectionName);
  }
}
