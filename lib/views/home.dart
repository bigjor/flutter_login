import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

import '../components/UIButton.dart';
import '../components/UIHeader.dart';
import '../state/LoginState.dart';
import '../styles/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    context.read<LoginState>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(maxWidth: 500.0),
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: _buildHome(),
              )),
        ),
      ),
    );
  }

  Widget _buildHome() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHeader(title: "Home", description: "You are logged"),
          const SizedBox(height: 20.0),
          UIButton(label: "Log Out", action: logout),
        ],
      );
}
