import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:judicialclient/src/routes/principal_routes.dart';
import 'package:judicialclient/src/security/bloc/login/login_bloc.dart';
import 'package:judicialclient/src/theme/principal_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: routes,
          title: 'Judicial app',
          theme: theme),
    );
  }
}
