import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './state/LoginState.dart';
import './router/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginState()),
      ],
      child: const MyApp(),
    ),
  );
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
