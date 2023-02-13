import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/utilities/size_config.dart';

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
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenSize(context, 5.w, 10.w, 10.w)),
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
