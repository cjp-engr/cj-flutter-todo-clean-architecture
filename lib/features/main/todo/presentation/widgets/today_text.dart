import 'package:flutter/material.dart';
import 'package:todo_app_clean_arch/core/widgets/header_text.dart';

class TodayText extends StatelessWidget {
  const TodayText({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return HeaderText(text: 'Today', color: themeData.colorScheme.onPrimary);
  }
}
