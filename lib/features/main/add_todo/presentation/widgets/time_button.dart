import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';

class TimeButton extends StatelessWidget {
  final Function() onTap;
  const TimeButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        text: 'AM', onTap: () => onTap, buttonWidth: 10.w, buttonHeight: 6.h);
  }
}
