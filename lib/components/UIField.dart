import 'package:flutter/material.dart';
import '../styles/styles.dart';

class UIField extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final TextEditingController? controller;
  final FocusNode? focus;
  final VoidCallback unfocus;
  final bool? isPassword;

  const UIField(
      {Key? key,
      this.label = "",
      this.icon,
      this.controller,
      this.focus,
      required this.unfocus,
      this.isPassword = false})
      : super(key: key);

  @override
  _UIFieldState createState() => _UIFieldState();
}

class _UIFieldState extends State<UIField> {
  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */
  void activate() => setState(() {
        widget.unfocus();
        if (widget.focus != null) widget.focus!.requestFocus();
      });

  /* -------------------------------------------------------------------------- */
  /*                                   BUILDS                                   */
  /* -------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: activate,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: widget.focus != null && widget.focus!.hasFocus
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
                _buildLabel(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIcon(),
                _buildField(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel() => Container(
        child: Text(
          widget.label ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget _buildIcon() => Container(
        width: 50.0,
        child: Icon(
          widget.icon!,
          color: Colors.white,
        ),
      );

  Widget _buildField() => Expanded(
          child: Container(
        height: 15.0,
        child: TextFormField(
          cursorColor: AppStyle.accent,
          keyboardType: TextInputType.text,
          obscureText: widget.isPassword ?? false,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          // decoration: BoxDecoration(),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onTap: activate,
          onChanged: (String token) => {},
          controller: widget.controller,
          focusNode: widget.focus,
        ),
      ));
}
