import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ValidateEmailLogin) {
      yield* this._validateEmailLogin(event);
    } else if (event is ValidatePasswordLogin) {
      yield* this._validatePasswordLogin(event);
    } else if (event is MessageServerLogin) {
      yield* this._messageServerLogin(event);
    } else if (event is IsLoadingFalse) {
      yield* this._isLoadingFalse(event);
    } else if (event is IsLoadingTrue) {
      yield* this._isLoadingTrue(event);
    } else if (event is LoginStateInitial) {
      yield* this._loginStateInitial(event);
    }
  }

  Stream<LoginState> _validateEmailLogin(ValidateEmailLogin event) async* {
    yield state.copyWithCurrentEmailLogin(currentEmailLogin: event.emailLogin);
  }

  Stream<LoginState> _validatePasswordLogin(
      ValidatePasswordLogin event) async* {
    yield state.copyWithCurrentPasswordLogin(currentPasswordLogin: event.passwordLogin);
  }

  Stream<LoginState> _messageServerLogin(MessageServerLogin event) async* {
    String messageServer = event.messageServerLog;

    yield state.copyWithMessageServerLogin(messageServerLogin: messageServer);
  }

  Stream<LoginState> _isLoadingFalse(IsLoadingFalse event) async* {
    yield state.copyWithIsLoading(isLoading: false);
  }

  Stream<LoginState> _isLoadingTrue(IsLoadingTrue event) async* {
    yield state.copyWithIsLoading(isLoading: true);
  }

  Stream<LoginState> _loginStateInitial(LoginStateInitial event) async* {
    yield state.initialState();
  }
}
