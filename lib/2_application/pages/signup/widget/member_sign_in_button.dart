import 'package:flutter/material.dart';

class MemberSigninButton extends StatelessWidget {
  const MemberSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextButton(
      onPressed: () {},
      child: Text(
        'Already a member? Sign in!',
        style: TextStyle(color: themeData.colorScheme.secondary),
      ),
    );
  }
}
