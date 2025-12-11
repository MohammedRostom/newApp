import 'package:auth_feature_1_0/core/Conenction/cubit/test_network_cubit.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static final InstanceUsecase = LocatorApp.sl<UserUseCase>();
  Future<void> loginUser(String email, String password) async {
    emit(AuthLoading());
    try {
      final hasInternet = await CheckInternet();
      if (!hasInternet) {
        // مفيش نت
        print("❌ No Internet Connection");
        emit(AuthCHeckNet(isHasInternet: false));
        return; // مهم: رجع فوراً علشان ما يكملش login
      } else {
        emit(AuthCHeckNet(isHasInternet: true));
        final user = await InstanceUsecase.loginFromUseCase(email, password);
        print("✅ User logged in: $user");
        emit(AuthDone());
      }
    } catch (e) {
      // خطأ عام
      print("⚠ Login Error: $e");
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
