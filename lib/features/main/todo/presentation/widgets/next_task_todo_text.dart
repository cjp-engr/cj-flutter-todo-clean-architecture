import 'package:flutter/material.dart';
import 'package:todo_app_clean_arch/core/widgets/header_text.dart';

class NextTaskTodoText extends StatelessWidget {
  const NextTaskTodoText({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return HeaderText(
        text: 'Next Task', color: themeData.colorScheme.secondary);
  }
}
