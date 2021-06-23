import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLogged = false;

  bool get isLogged => _isLogged;

  void login() {
    _isLogged = true;
    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    notifyListeners();
  }

  /// Makes `LoginState` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(FlagProperty('logged', value: isLogged));
  }
}
