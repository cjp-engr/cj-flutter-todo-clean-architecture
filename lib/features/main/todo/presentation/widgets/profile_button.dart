import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/image_button.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageButton(
      path: 'assets/images/flutter_logo.png',
      onTap: () {},
      buttonWidth: SizeConfig.screenSize(context, 12.w, 1.w, 1.w),
      buttonHeight: SizeConfig.screenSize(context, 12.w, 1.w, 1.w),
      isNetwork: false,
    );
  }
}
