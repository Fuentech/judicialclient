part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ValidateEmailLogin extends LoginEvent {
  final String emailLogin;

  ValidateEmailLogin(this.emailLogin);
}

class ValidatePasswordLogin extends LoginEvent {
  final String passwordLogin;

  ValidatePasswordLogin(this.passwordLogin);
}

class MessageServerLogin extends LoginEvent {
  final String messageServerLog;

  MessageServerLogin(this.messageServerLog);
}

class IsLoadingFalse extends LoginEvent {}

class IsLoadingTrue extends LoginEvent {}

class LoginStateInitial extends LoginEvent {}
