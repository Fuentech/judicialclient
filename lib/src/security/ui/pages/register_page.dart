import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';
import 'package:judicialclient/src/ui/shared/widgets/buttons/basic_button.dart';
import 'package:judicialclient/src/ui/shared/widgets/gradients/principal_gradient.dart';
import 'package:judicialclient/src/ui/shared/widgets/textfields/basic_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PrincipalGradient(
          containerChild: Stack(
            children: [_bodyPage(context)],
          ),
        ),
      ),
    );
  }

  Widget _bodyPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_textArea(context)],
    );
  }

  Widget _textArea(BuildContext context) {
    final nameFieldController = TextEditingController();
    final lastNameFieldController = TextEditingController();
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();
    final passwordVerifyFieldController = TextEditingController();
    return Column(
      children: [
        FittedBox(
          child: Text(
            'Registrarse',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 32),
        FittedBox(
          child: _createTextField(
            Icons.perm_identity,
            'Nombres',
            nameFieldController,
            false,
            false,
            (name) {},
          ),
        ),
        SizedBox(height: 24),
        FittedBox(
          child: _createTextField(
            Icons.perm_identity,
            'Apellidos',
            nameFieldController,
            false,
            false,
            (lastName) {},
          ),
        ),
        SizedBox(height: 24),
        FittedBox(
          child: _createTextField(
            Icons.alternate_email,
            'Correo electronico',
            emailFieldController,
            false,
            false,
            (email) {},
          ),
        ),
        SizedBox(height: 24),
        FittedBox(
          child: _createTextField(
            Icons.lock_outline,
            'Contraseña',
            passwordFieldController,
            false,
            true,
            (password) {},
          ),
        ),
        SizedBox(height: 24),
        FittedBox(
          child: _createTextField(
            Icons.lock_outline,
            'Repita contraseña',
            passwordFieldController,
            false,
            true,
            (passwordVerify) {},
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 27),
            Transform.scale(
              scale: 0.6,
              child: Theme(
                child: Checkbox(
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (valor) {
                    setState(
                      () {
                        isChecked = valor!;
                      },
                    );
                  },
                  activeColor: judicialColors.judicialYellow(),
                ),
                data: ThemeData(
                  primaryColor: Colors.white,
                  unselectedWidgetColor: Colors.white,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Montserrat'),
                children: [
                  TextSpan(text: 'Acepto '),
                  TextSpan(
                    text: 'términos y condiciones',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
        BasicButton(
          text: 'CREAR MI CUENTA',
          onPressed: () {},
          backgroundColor: Colors.white,
          textColor: judicialColors.judicialYellow(),
        ),
        SizedBox(height: 15),
        RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w100),
            children: [
              TextSpan(text: 'regresar a '),
              TextSpan(
                text: 'Iniciar Sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createTextField(
      IconData iconData,
      String nameField,
      TextEditingController textEditingController,
      bool autofocus,
      bool isPassword,
      void Function(String) onChanged) {
    return BasicTextfield(
      iconData: iconData,
      placeHolder: nameField,
      hintText: nameField,
      textEditingController: textEditingController,
      autofocus: autofocus,
      isPassword: isPassword,
      onChanged: onChanged,
      messageValidate: 'validate $nameField input',
    );
  }
}
