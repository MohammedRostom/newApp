import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/Conenction/cubit/test_network_cubit.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/auth_feature/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static final InstanceUsecase = LocatorApp.sl<UserUseCase>();
  static final InstanceChecker = LocatorApp.sl<CheckConnection>();

  Future<void> loginUser(String email, String password) async {
    emit(AuthLoading());
    try {
      final hasInternet = await InstanceChecker.CheckInternet();
      if (!hasInternet) {
        // مفيش نت
        emit(AuthCHeckNet(isHasInternet: false));
        return; // مهم: رجع فوراً علشان ما يكملش login
      } else {
        emit(AuthCHeckNet(isHasInternet: true));
        final user = await InstanceUsecase.loginFromUseCase(email, password);
        emit(AuthDone(user: user));
      }
    } catch (e) {
      // خطأ عام
      print("⚠ Login Error: $e");
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> SignupUser(
    String username,
    String email,
    String password,
  ) async {
    emit(AuthLoading());
    try {
      final hasInternet = await InstanceChecker.CheckInternet();
      if (!hasInternet) {
        // مفيش نت
        emit(AuthCHeckNet(isHasInternet: false));
        return; // مهم: رجع فوراً علشان ما يكملش signup
      } else {
        emit(AuthCHeckNet(isHasInternet: true));
        final user = await InstanceUsecase.registrationFromUseCase(
          username,
          email,
          password,
        );
        emit(AuthDone(user: user));
      }
    } catch (e) {
      // خطأ عام
      print("⚠ Signup Error: $e");
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> logoutUser() async {
    emit(AuthLoading());
    try {
      await InstanceUsecase.logoutFromUseCase();
      emit(AuthDone());
    } catch (e) {
      // خطأ عام
      print("⚠ Logout Error: $e");
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
