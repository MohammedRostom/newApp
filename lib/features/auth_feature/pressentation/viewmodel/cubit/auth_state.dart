part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCHeckNet extends AuthState {
  final bool isHasInternet;
  AuthCHeckNet({required this.isHasInternet});
}

final class AuthDone extends AuthState {
  final AuthUserEntity? userEntity;
  AuthDone({this.userEntity});
}

final class AuthError extends AuthState {
  final String errorMessage;
  AuthError({required this.errorMessage});
}

final class AuthRestPass extends AuthState {}

final class AuthSendToConfirm extends AuthState {}

final class AuthLoggedOut extends AuthState {}

final class AuthTogglePasswordVisibility extends AuthState {}
