// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/utilities/size_config.dart';

class StatusTodoButton extends StatelessWidget {
  final int status;
  const StatusTodoButton({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenSize(context, 0.w, 10.w, 0.w)),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(28.w, 1.5.h)),
          backgroundColor:
              MaterialStateProperty.all(themeData.colorScheme.onSecondary),
        ),
        child: AutoSizeText('To do',
            style: TextStyle(
                color: themeData.colorScheme.onPrimary, fontSize: 3.sp)),
      ),
    );
  }
}
