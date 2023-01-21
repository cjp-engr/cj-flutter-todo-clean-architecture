import 'dart:ui';

import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Test', style: themeData.textTheme.button),
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(40, 50)),
          backgroundColor:
              MaterialStateProperty.all(themeData.colorScheme.secondary),
        ),
      ),
    );
  }
}
