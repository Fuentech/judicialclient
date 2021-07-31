
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:judicialclient/src/security/bloc/login/login_bloc.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';
import 'package:judicialclient/src/ui/shared/logos/logo_home.dart';
import 'package:judicialclient/src/ui/shared/widgets/buttons/basic_button.dart';
import 'package:judicialclient/src/ui/shared/widgets/buttons/url_button.dart';
import 'package:judicialclient/src/ui/shared/widgets/textfields/basic_textfield.dart';

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
        backgroundColor: Color(0xffF2F2F2),
        body: Stack(
          children: [_loginForm(context, loginBloc)],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context, LoginBloc loginBloc) {
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (_, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    LogoHome(),
                    SizedBox(height: 20),
                    Text('Iniciar sesión',
                        style: TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('¿Ya tienes una cuenta?',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                    SizedBox(height: 5),
                    Text('¡Ingresa aquí!',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BasicTextfield(
                          iconData: Icons.mail_outline,
                          placeHolder: 'Correo',
                          hintText: 'ejemplo@judicialapp.com',
                          textInputType: TextInputType.emailAddress,
                          textEditingController: emailFieldController,
                          autofocus: true,
                          onChanged: (email) {
                            loginBloc.add(ValidateEmailLogin(email));
                          },
                          messageValidate: 'validate email input',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    BasicTextfield(
                      iconData: Icons.lock,
                      placeHolder: 'Contraseña',
                      hintText: 'Contraseña',
                      textEditingController: passwordFieldController,
                      isPassword: true,
                      onChanged: (password) {
                        loginBloc.add(ValidatePasswordLogin(password));
                      },
                      messageValidate: 'validate password input',
                    ),
                    SizedBox(height: 20),
                    BasicButton(
                      text: 'Ingresar',
                      backgroundColor: judicialColors.judicialBrown(),
                      isLoading: state.isLoading,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10.0),
                    BasicButton(
                      text: 'Registrarse',
                      backgroundColor: judicialColors.judicialYellow(),
                      isLoading: state.isLoading,
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 80),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              UrlButton(
                urlName: 'Sitio web: www.judicialapp.com',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
