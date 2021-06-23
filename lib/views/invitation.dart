import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

import '../components/UIButton.dart';
import '../components/UIField.dart';
import '../components/UIHeader.dart';
import '../styles/styles.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({Key? key}) : super(key: key);

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  /* -------------------------------------------------------------------------- */
  /*                                DECLARATIONS                                */
  /* -------------------------------------------------------------------------- */
  late GlobalKey<FormState> _formKey;
  late TextEditingController _invitationCodeController;
  late FocusNode _invitationCodeFocus;

  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _invitationCodeController = new TextEditingController();
    _invitationCodeFocus = new FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _invitationCodeFocus.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _invitationCodeController.dispose();
    _invitationCodeFocus.dispose();
  }

  void unfocus() {
    setState(() {
      _invitationCodeFocus.unfocus();
    });
  }

  void signup() {
    final sbNoData = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Put the invitation code in the form input'));

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    if (_invitationCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    Navigator.pushNamed(context, '/register');
  }

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
            Expanded(
                child: Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500.0),
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(child: _buildForm()),
                ),
              ),
            )),
          ],
        ));
  }

  Widget _buildForm() => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHeader(
                title: "Invitation",
                description:
                    "Insert your invitation code to continue with the registration page"),
            const SizedBox(height: 20.0),
            UIField(
              label: "Code",
              icon: LineIcons.key,
              controller: _invitationCodeController,
              focus: _invitationCodeFocus,
              unfocus: unfocus,
              isPassword: false,
            ),
            const SizedBox(height: 20.0),
            UIButton(
              label: "Go to Register",
              action: signup,
            ),
          ],
        ),
      );
}
