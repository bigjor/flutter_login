import 'package:flutter/material.dart';
import 'package:login/styles/styles.dart';

class UIButton extends StatefulWidget {
  final String? label;
  final VoidCallback? action;
  const UIButton({Key? key, this.label, this.action}) : super(key: key);

  @override
  _UIButtonState createState() => _UIButtonState();
}

class _UIButtonState extends State<UIButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: AppStyle.kButtonStyle,
        onPressed: widget.action != null
            ? widget.action!
            : () => print("action not implemented"),
        child: Text(
          widget.label ?? '',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
