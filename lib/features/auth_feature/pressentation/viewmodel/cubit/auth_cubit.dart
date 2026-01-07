import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/getUser_usecase.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.connectionChecker,
    required this.getUserUseCase,
    // required this.firebaseAuthServiceAbst,
  }) : super(AuthInitial());

  final UserUseCase authUserUseCase = UserUseCase(
    repositoryAbs: gtit<RepositoryAbs>(),
  );

  final GetUserUsecase getUserUseCase;
  final CheckConnection connectionChecker;
  // final FirebaseAuthServiceAbst firebaseAuthServiceAbst;

  /// ================= LOGIN =================
  Future<void> loginUser(String email, String password) async {
    emit(AuthLoading());

    try {
      final hasInternet = await connectionChecker.CheckInternet();
      if (!hasInternet) {
        emit(AuthCHeckNet(isHasInternet: false));
        return;
      }

      // 1️⃣ Login
      final user = await authUserUseCase.loginCall(email, password);

      // 2️⃣ Get full profile from Firestore
      final profile = await getUserUseCase.GetUserCall(
        user.id,
        Constant.CollectionUsers,
      );

      emit(AuthDone(userEntity: profile ?? user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
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

      final user = await authUserUseCase.regiterCall(username, email, password);

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
    await authUserUseCase.logoutCall();
    emit(AuthLoggedOut());
  }

  // + SIgn with google
  Future<void> restPass(String email) async {
    emit(AuthLoading());
    await authUserUseCase.resetPasswordCall(email);
    emit(AuthRestPass());
  }

  // a دي تشتغل لما تعمل لوجين جو يا معلم ف الهوم مثلا او ف الاعادادات
  Future<void> confirmEmail() async {
    emit(AuthLoading());
    await authUserUseCase.sendEmailVerificationCall();
    emit(AuthSendToConfirm());
  }
}
