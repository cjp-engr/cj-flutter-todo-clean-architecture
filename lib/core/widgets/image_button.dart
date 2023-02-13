// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String path;
  final Function() onTap;
  final double buttonWidth;
  final double buttonHeight;
  final bool isNetwork;
  const ImageButton({
    Key? key,
    required this.path,
    required this.onTap,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.isNetwork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
        // backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}
