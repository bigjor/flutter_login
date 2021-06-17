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
    _nicknameController = new TextEditingController();
    _passwordController = new TextEditingController();
    _nicknameFocus = new FocusNode();
    _passwordFocus = new FocusNode();
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
    _nicknameFocus.unfocus();
    _passwordFocus.unfocus();
  }

  /* -------------------------------------------------------------------------- */
  /*                                   BUILDS                                   */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primary,
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          child: _buildForm()),
      bottomSheet: Container(
        color: AppStyle.primary,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child:
                _buildBottomSupport("Don't have an account?", "Sing up", () {})
            // _buildBottomSupport("Do you have an invitation?", "Join us", () {})
            ),
      ),
    );
  }

  Widget _buildInput(String label, IconData icon,
      TextEditingController controller, FocusNode focus, bool isPassword) {
    void activate() => setState(() {
          unfocus();
          focus.requestFocus();
        });

    return GestureDetector(
      onTap: activate,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: focus.hasFocus
            ? AppStyle.kBoxDecorationStyleInputActive
            : AppStyle.kBoxDecorationStyleInput,
        height: 60.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 50.0),
                Container(
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 15.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: isPassword,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    // decoration: BoxDecoration(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onTap: activate,
                    onSubmitted: (String token) => {},
                    onChanged: (String token) => {},
                    controller: controller,
                    focusNode: focus,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback action) => ElevatedButton(
        style: AppStyle.kButtonStyle,
        onPressed: () {},
        child: Text(label, style: TextStyle(color: Colors.white)),
      );

  Widget _buildForm() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          const Text("Please log in to continue",
              style: const TextStyle(color: Colors.white, fontSize: 16.0)),
          const SizedBox(height: 20.0),
          _buildInput("Nickname", Icons.email_outlined, _nicknameController,
              _nicknameFocus, false),
          const SizedBox(height: 20.0),
          _buildInput("Password", Icons.lock, _passwordController,
              _passwordFocus, true),
          const SizedBox(height: 20.0),
          _buildButton("Log In", () => {}),
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
      );

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
