import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TodayTaskList extends StatelessWidget {
  const TodayTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      children: [
        SizedBox(width: 4.w),
        Icon(Icons.brightness_5, size: 6.w),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Lorem Impsum Che',
              style: TextStyle(
                  color: themeData.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
            AutoSizeText(
              'test test test',
              style: TextStyle(
                  color: themeData.colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
