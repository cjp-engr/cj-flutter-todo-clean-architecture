// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return TextButton(
      onPressed: onTap,
      child: Text(textButton),
    );
  }
}
