import 'package:login/components/UIButton.dart';
import 'package:login/components/UIField.dart';
import 'package:login/components/UIHeader.dart';

import '../styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* -------------------------------------------------------------------------- */
  /*                                DECLARATIONS                                */
  /* -------------------------------------------------------------------------- */
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nicknameController;
  late TextEditingController _passwordController;
  late FocusNode _nicknameFocus;
  late FocusNode _passwordFocus;

  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nicknameController = new TextEditingController();
    _passwordController = new TextEditingController();
    _nicknameFocus = new FocusNode();
    _passwordFocus = new FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _nicknameFocus.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
    _nicknameFocus.dispose();
    _passwordFocus.dispose();
  }

  void unfocus() {
    setState(() {
      _nicknameFocus.unfocus();
      _passwordFocus.unfocus();
    });
  }

  void login() {
    final sbNoData = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Put data in the form inputs'));

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    if (_nicknameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    // STATE LOGGED
  }

  void signup() {
    Navigator.pushNamed(context, '/register');
  }

  void invitation() {
    Navigator.pushNamed(context, '/invitation');
  }

  /* -------------------------------------------------------------------------- */
  /*                                   BUILDS                                   */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primary,
      body: Center(
        child: Container(
            constraints: BoxConstraints(maxWidth: 500.0),
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(child: _buildForm())),
      ),
      bottomSheet: Container(
        color: AppStyle.primary,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child:
                _buildBottomSupport("Don't have an account?", "Sign up", signup)
            // _buildBottomSupport("Do you have an invitation?", "Join us", () {})
            ),
      ),
    );
  }

  Widget _buildForm() => Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHeader(title: "Login", description: "Please log in to continue"),
          const SizedBox(height: 20.0),
          UIField(
              label: "Nickname",
              icon: Icons.email_outlined,
              controller: _nicknameController,
              focus: _nicknameFocus,
              unfocus: unfocus,
              isPassword: false),
          const SizedBox(height: 20.0),
          UIField(
              label: "Password",
              icon: Icons.lock,
              controller: _passwordController,
              focus: _passwordFocus,
              unfocus: unfocus,
              isPassword: true),
          const SizedBox(height: 20.0),
          UIButton(label: "Log In", action: login),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => {},
            child: Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(color: AppStyle.accent),
              ),
            ),
          )
        ],
      ));

  Widget _buildBottomSupport(
          String descriptionlabel, String buttonLabel, VoidCallback action) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            descriptionlabel,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 4.0),
          GestureDetector(
            onTap: action,
            child: Text(
              buttonLabel,
              style: TextStyle(color: AppStyle.accent),
            ),
          )
        ],
      );
}
