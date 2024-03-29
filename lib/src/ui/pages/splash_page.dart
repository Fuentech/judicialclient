import 'dart:async';

import 'package:flutter/material.dart';

import 'package:judicialclient/src/ui/shared/widgets/gradients/principal_gradient.dart';
import 'package:judicialclient/src/ui/shared/widgets/logos/logo_home.dart';
import 'package:judicialclient/src/ui/shared/widgets/titles/judicialapp_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/security/loginpage'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: PrincipalGradient(
          containerChild: Stack(
            children: [
              _splashInside(),
              _footerPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _splashInside() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: LogoHome(
              alignment: Alignment.bottomCenter, width: 148.95, height: 171.12,
            ),
          ),
          FittedBox(
            child: JudicialappTitle(
              alignment: Alignment.topCenter,
            ),
          )
        ],
      ),
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
