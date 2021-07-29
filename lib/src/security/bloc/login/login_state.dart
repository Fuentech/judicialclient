part of 'login_bloc.dart';

class LoginState {
  final String currentEmailLogin;
  final String currentPasswordLogin;
  final String messageServerLogin;
  final bool formLoginValid;
  final bool isLoading;

  LoginState(
      {this.currentEmailLogin = '',
      this.currentPasswordLogin = '',
      this.messageServerLogin = '',
      this.isLoading = false})
      : this.formLoginValid =
            (currentEmailLogin.length > 0 && currentPasswordLogin.length > 7)
                ? true
                : false;

  LoginState copyWithCurrentEmailLogin({required String currentEmailLogin}) =>
      LoginState(currentEmailLogin: currentEmailLogin);

  LoginState copyWithCurrentPasswordLogin(
          {required String currentPasswordLogin}) =>
      LoginState(currentPasswordLogin: currentPasswordLogin);

  LoginState copyWithMessageServerLogin({required String messageServerLogin}) =>
      LoginState(messageServerLogin: messageServerLogin);

  LoginState copyWithIsLoading({required bool isLoading}) =>
      LoginState(isLoading: isLoading);

  LoginState initialState() => new LoginState();
}
