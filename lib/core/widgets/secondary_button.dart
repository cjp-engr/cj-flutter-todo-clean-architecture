import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double buttonWidth;
  final double buttonHeight;
  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            fixedSize:
                MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
            backgroundColor:
                MaterialStateProperty.all(themeData.colorScheme.onPrimary),
            side: MaterialStateProperty.all(
                BorderSide(color: themeData.colorScheme.secondary))),
        child: AutoSizeText(text,
            style: TextStyle(color: themeData.colorScheme.secondary)),
      ),
    );
  }
}
