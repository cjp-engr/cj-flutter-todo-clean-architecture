import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function() onTap;
  final String textButton;
  const CustomTextButton({
    Key? key,
    required this.onTap,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      child: AutoSizeText(
        textButton,
        style: TextStyle(color: themeData.colorScheme.secondary),
      ),
    );
  }
}
