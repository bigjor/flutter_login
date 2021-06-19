import 'package:flutter/material.dart';
import '../views/invitation.dart';
import '../views/register.dart';
import '../views/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case '/invitation':
        return MaterialPageRoute(builder: (context) => InvitationPage());
      default:
        return _errorRoutePage();
    }
  }

  static Route<dynamic> _errorRoutePage() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(child: Text("Pagina no encontrada")),
            ));
  }
}
