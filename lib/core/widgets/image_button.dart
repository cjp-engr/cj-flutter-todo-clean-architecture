// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double buttonWidth;
  final double buttonHeight;
  const ImageButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
        backgroundColor:
            MaterialStateProperty.all(themeData.colorScheme.secondary),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Image.asset('assets/images/flutter_logo.png'),
    );
  }
}
