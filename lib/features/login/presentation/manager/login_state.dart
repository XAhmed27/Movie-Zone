part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {

  final LoginResponseBody loginResponseBody;
  LoginSuccess({required this.loginResponseBody});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}
