import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';

class SignupButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SignupButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenSize(context, 20.w, 10.w, 5.w)),
      child: PrimaryButton(
        text: text,
        onTap: onTap,
        buttonWidth: SizeConfig.screenSize(context, 20.w, 20.w, 100.w),
        buttonHeight: SizeConfig.screenSize(context, 8.h, 8.h, 7.h),
      ),
    );
  }
}
