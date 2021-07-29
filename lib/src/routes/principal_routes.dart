import 'package:flutter/material.dart';
import 'package:judicialclient/src/security/ui/pages/login_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  '/login': (_) => LoginPage()
};
