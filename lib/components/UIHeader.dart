import 'package:flutter/material.dart';

class UIHeader extends StatelessWidget {
  final String? title;
  final String? description;
  const UIHeader({Key? key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
        if (description != null) ...[
          Text(
            description!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ],
    );
  }
}
