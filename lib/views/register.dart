import 'package:flutter/material.dart';
import '../styles/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _back() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.primary,
        body: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 28.0,
                  icon: Icon(Icons.chevron_left),
                  onPressed: _back,
                ),
              )
            ]),
            Expanded(child: Center()),
          ],
        ));
  }
}
