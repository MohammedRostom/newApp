part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCHeckNet extends AuthState {
  final bool isHasInternet;
  AuthCHeckNet({required this.isHasInternet});
}

final class AuthDone extends AuthState {
  final AuthUserEntity? user;
  AuthDone({this.user});
}

final class AuthError extends AuthState {
  final String errorMessage;
  AuthError({required this.errorMessage});
}
