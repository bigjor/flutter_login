import 'package:login/components/UIButton.dart';
import 'package:login/components/UIField.dart';
import 'package:login/components/UIHeader.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import '../styles/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /* -------------------------------------------------------------------------- */
  /*                                DECLARATIONS                                */
  /* -------------------------------------------------------------------------- */
  late GlobalKey<FormState> _formKey;
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late FocusNode _fullNameFocus;
  late FocusNode _phoneFocus;
  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  late FocusNode _confirmPasswordFocus;

/* -------------------------------------------------------------------------- */
/*                                   METHODS                                  */
/* -------------------------------------------------------------------------- */
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _fullNameController = new TextEditingController();
    _phoneController = new TextEditingController();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
    _fullNameFocus = new FocusNode();
    _phoneFocus = new FocusNode();
    _emailFocus = new FocusNode();
    _passwordFocus = new FocusNode();
    _confirmPasswordFocus = new FocusNode();

    // Establece el focus del primer elemento una vez se ha acabado el build
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _fullNameFocus.requestFocus();
      });
    });
  }

  void unfocus() {
    if (mounted)
      setState(() {
        _fullNameFocus.unfocus();
        _phoneFocus.unfocus();
        _emailFocus.unfocus();
        _passwordFocus.unfocus();
        _confirmPasswordFocus.unfocus();
      });
  }

  void login() {
    final sbNoData = SnackBar(
      backgroundColor: Colors.red,
      content: Text('Put data in the form inputs'),
      duration: Duration(seconds: 2),
      // action: SnackBarAction(
      //   label: 'Close',
      //   textColor: Colors.white,
      //   onPressed: () {},
      // ),
    );

    final sbNotMatch = SnackBar(
      backgroundColor: Colors.red,
      content: Text('Passwords do not match'),
      duration: Duration(seconds: 2),
      // action: SnackBarAction(
      //   label: 'Close',
      //   textColor: Colors.white,
      //   onPressed: () {},
      // ),
    );

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    if (_emailController.text.isEmpty ||
        _fullNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(sbNoData);
      return;
    }

    if (_passwordController != _confirmPasswordController) {
      ScaffoldMessenger.of(context).showSnackBar(sbNotMatch);
    }

    // STATE LOGGED
  }

  void _back() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.primary,
        body: Stack(
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
              title: "Create Account",
              description: "Please fill the input blow here",
            ),
            const SizedBox(height: 20.0),
            UIField(
              label: "Full Name",
              icon: Icons.person_outline,
              controller: _fullNameController,
              focus: _fullNameFocus,
              unfocus: unfocus,
              isPassword: false,
            ),
            const SizedBox(height: 20.0),
            UIField(
              label: "Phone",
              icon: Icons.phone_outlined,
              controller: _phoneController,
              focus: _phoneFocus,
              unfocus: unfocus,
              isPassword: false,
            ),
            const SizedBox(height: 20.0),
            UIField(
              label: "Email",
              icon: Icons.email_outlined,
              controller: _emailController,
              focus: _emailFocus,
              unfocus: unfocus,
              isPassword: false,
            ),
            const SizedBox(height: 20.0),
            UIField(
              label: "Password",
              icon: Icons.zoom_out_sharp, // Entypo.key,
              controller: _passwordController,
              focus: _passwordFocus,
              unfocus: unfocus,
              isPassword: true,
            ),
            const SizedBox(height: 20.0),
            UIField(
              label: "Confirm Password",
              icon: Icons.zoom_out_sharp,
              controller: _confirmPasswordController,
              focus: _confirmPasswordFocus,
              unfocus: unfocus,
              isPassword: true,
            ),
            const SizedBox(height: 20.0),
            UIButton(label: "Create Account", action: login),
          ],
        ),
      );
}
