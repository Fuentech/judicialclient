import 'package:flutter/material.dart';
import 'package:judicialclient/src/security/ui/pages/login_page.dart';
import 'package:judicialclient/src/security/ui/pages/register_page.dart';
import 'package:judicialclient/src/ui/pages/splash_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  //TODO: initial path
  '/splash': (_) => SplashPage(),
  //TODO: security path
  '/security/loginpage': (_) => LoginPage(),
  '/security/registerpage': (_) => RegisterPage()
};
