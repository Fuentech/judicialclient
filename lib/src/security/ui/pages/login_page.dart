import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:judicialclient/src/security/bloc/login/login_bloc.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';
import 'package:judicialclient/src/ui/shared/widgets/buttons/basic_button.dart';
import 'package:judicialclient/src/ui/shared/widgets/gradients/principal_gradient.dart';
import 'package:judicialclient/src/ui/shared/widgets/logos/logo_home.dart';
import 'package:judicialclient/src/ui/shared/widgets/textfields/basic_textfield.dart';
import 'package:judicialclient/src/ui/shared/widgets/titles/judicialapp_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PrincipalGradient(
          containerChild: Stack(
            children: [_bodyPage(context, loginBloc), _footerPage()],
          ),
        ),
      ),
    );
  }

  Widget _bodyPage(BuildContext context, LoginBloc loginBloc) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageContainer(context, loginBloc),
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context, LoginBloc loginBloc) {
    return Column(
      children: [
        FittedBox(
          child: LogoHome(
            alignment: Alignment.topCenter, width: 148.95, height: 171.12,
          ),
        ),
        FittedBox(
          child: JudicialappTitle(
            alignment: Alignment.topCenter,
          ),
        ),
        SizedBox(height: 25),
        _textArea(context, loginBloc),
        SizedBox(height: 24),
        _buttonArea(context, loginBloc),
      ],
    );
  }

  Widget _textArea(BuildContext context, LoginBloc loginBloc) {
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FittedBox(
          child: BasicTextfield(
            iconData: Icons.mail_outline,
            placeHolder: 'Email',
            hintText: 'Correo electronico',
            textInputType: TextInputType.emailAddress,
            textEditingController: emailFieldController,
            autofocus: false,
            onChanged: (email) {
              loginBloc.add(ValidateEmailLogin(email));
            },
            messageValidate: 'validate email input',
          ),
        ),
        SizedBox(height: 24),
        FittedBox(
          child: BasicTextfield(
            iconData: Icons.lock_outline,
            placeHolder: '',
            hintText: 'Contraseña',
            textEditingController: passwordFieldController,
            autofocus: false,
            isPassword: true,
            onChanged: (password) {
              loginBloc.add(ValidatePasswordLogin(password));
            },
            messageValidate: 'validate password input',
          ),
        ),
      ],
    );
  }

  Widget _buttonArea(BuildContext context, LoginBloc loginBloc) {
    return Column(
      children: [
        FittedBox(
          child: BasicButton(
            text: 'INICIAR SESIÓN',
            onPressed: () {},
            backgroundColor: Colors.white,
            textColor: judicialColors.judicialYellow(),
          ),
        ),
        SizedBox(height: 8),
        FittedBox(
          child: BasicButton(
            text: 'REGÍSTRATE',
            onPressed: () => Navigator.pushReplacementNamed(context, '/security/registerpage'),
            backgroundColor: judicialColors.judicialYellow(),
            textColor: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        FittedBox(
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontStyle: FontStyle.normal,
                fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget _footerPage() {
    return Stack(
      children: [
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                child: Text(
                  'judicialapp.com',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ],
    );
  }
}
