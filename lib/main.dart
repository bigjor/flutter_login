import 'package:login/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) {
      //     return LoginPage();
      //   },
      //   '/register': (BuildContext context) => RegisterPage(),
      //   '/invitation': (BuildContext context) => InvitationPage()
      // },
      // home: const LoginPage()
    );
  }
}
