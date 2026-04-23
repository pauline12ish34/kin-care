import 'package:flutter/material.dart';

class KpButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const KpButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
