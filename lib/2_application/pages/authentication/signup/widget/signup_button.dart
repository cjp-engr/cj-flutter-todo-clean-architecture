// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final Function() onTap;
  const SignupButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(40, 50)),
          backgroundColor:
              MaterialStateProperty.all(themeData.colorScheme.secondary),
        ),
        child: Text('Sign up',
            style: TextStyle(color: themeData.colorScheme.onPrimary)),
      ),
    );
  }
}
