// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';

class SaveTodoButton extends StatelessWidget {
  final Function() onTap;
  const SaveTodoButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        text: 'Save',
        onTap: () => onTap,
        buttonWidth: 35.w,
        buttonHeight: 10.h);
  }
}
