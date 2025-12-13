import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.connectionChecker}) : super(AuthInitial());

  final UserUseCase useCase = UserUseCase(
    repositoryAbs: LoactorApp.sl<RepositoryAbs>(),
  );
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

  /// ================= LOGOUT =================
  Future<void> logoutUser() async {
    emit(AuthLoading());
    await useCase.logoutFromUseCase();
  }
}
