import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/utilities/size_config.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color color;
  const HeaderText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
          fontSize: SizeConfig.screenSize(context, 18.sp, 40, 40),
          fontWeight: FontWeight.w500,
          color: color),
    );
  }
}
