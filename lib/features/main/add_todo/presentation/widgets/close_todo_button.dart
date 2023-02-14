import 'package:flutter/material.dart';

class CloseTodoButton extends StatelessWidget {
  const CloseTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close));
  }
}
