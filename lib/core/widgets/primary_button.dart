import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double buttonWidth;
  final double buttonHeight;
  const PrimaryButton({
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
          horizontal: SizeConfig.screenSize(context, 5.w, 10.w, 0.w)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
          backgroundColor:
              MaterialStateProperty.all(themeData.colorScheme.secondary),
        ),
        child: Text(text,
            style: TextStyle(color: themeData.colorScheme.onPrimary)),
      ),
    );
  }
}
