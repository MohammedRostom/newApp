import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.connectionChecker}) : super(AuthInitial());

  final UserUseCase useCase = UserUseCase(repositoryAbs: gtit<RepositoryAbs>());

  final CheckConnection connectionChecker;

  /// ================= LOGIN =================
  Future<void> loginUser(String email, String password) async {
    emit(AuthLoading());

    try {
      final hasInternet = await connectionChecker.CheckInternet();
      if (!hasInternet) {
        emit(AuthCHeckNet(isHasInternet: false));
        return;
      }

      final user = await useCase.loginFromUseCase(email, password);
      // get user And
      // if email from login === Email from FireStore ?
      // get userName from DucumentSnapshot
      // https://chatgpt.com/c/695c23f8-4fec-8329-a945-027969e6feaa

      emit(AuthDone(userEntity: user));
    } catch (e) {
      e is String
          ? emit(AuthError(errorMessage: e))
          : emit(AuthError(errorMessage: e.toString()));
    }
  }

  /// ================= SIGN UP =================
  Future<void> signupUser(
    String username,
    String email,
    String password,
  ) async {
    emit(AuthLoading());

    try {
      final hasInternet = await connectionChecker.CheckInternet();
      if (!hasInternet) {
        emit(AuthCHeckNet(isHasInternet: false));
        return;
      }

      final user = await useCase.registrationFromUseCase(
        username,
        email,
        password,
      );

      emit(AuthDone(userEntity: user));
    } catch (e) {
      e is String
          ? emit(AuthError(errorMessage: e))
          : emit(AuthError(errorMessage: e.toString()));
    }
  }

  // Future<AuthUserEntity?> getAuthUserFromFirestore({
  //   required String uid,
  //   required String username,
  //   required String collectionName,
  // }) {
  //   final fireStoreService = LoactorApp.sl<FireStoreServiceAbst>();
  //   final ModelStore = fireStoreService.getAuthUserFromFirestore(
  //     uid: uid,
  //     username: username,
  //     collectionName: collectionName,
  //   );
  //   emit(AuthInHome(userEntity: ModelStore as AuthUserEntity?));
  //   return ModelStore;
  // }

  /// ================= LOGOUT =================
  Future<void> logoutUser() async {
    emit(AuthLoading());
    await useCase.logoutFromUseCase();
    emit(AuthLoggedOut());
  }

  // + SIgn with google
  // + rest password
  // + COnfirem email
}
