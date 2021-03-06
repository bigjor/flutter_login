import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier, DiagnosticableTreeMixin {
  /* -------------------------------------------------------------------------- */
  /*                           INSTANCES & CONSTRUCTOR                          */
  /* -------------------------------------------------------------------------- */
  late SharedPreferences _prefs;

  /* -------------------------------------------------------------------------- */
  /*                                DECLARATIONS                                */
  /* -------------------------------------------------------------------------- */
  bool _isLogged = false;
  bool get isLogged => _isLogged;

  /* -------------------------------------------------------------------------- */
  /*                                STATE METHODS                               */
  /* -------------------------------------------------------------------------- */
  void login() {
    _isLogged = true;
    saveIsLogged();

    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    saveIsLogged();

    notifyListeners();
  }

  /* -------------------------------------------------------------------------- */
  /*                                PREFS METHODS                               */
  /* -------------------------------------------------------------------------- */
  void loadStateApp() async {
    _prefs = await SharedPreferences.getInstance();
    loadIsLogged();
    notifyListeners();
  }

  void saveIsLogged() {
    _prefs.setBool("isLogged", isLogged);
  }

  void loadIsLogged() {
    _isLogged = _prefs.getBool("isLogged") ?? false;
  }

  /// Makes `LoginState` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(FlagProperty('logged', value: isLogged));
  }
}
