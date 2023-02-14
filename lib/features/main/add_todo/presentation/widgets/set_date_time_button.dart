// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';

class SetDateTimeButton extends StatelessWidget {
  final Function() onTap;
  const SetDateTimeButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        text: 'Set', onTap: () {}, buttonWidth: 20.w, buttonHeight: 5.h);
  }
}
