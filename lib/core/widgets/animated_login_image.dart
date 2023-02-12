// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

import 'package:todo_app_clean_arch/core/utilities/size_config.dart';

class AnimatedLoginImage extends StatefulWidget {
  final RiveAnimationController controller1;
  const AnimatedLoginImage({
    Key? key,
    required this.controller1,
  }) : super(key: key);

  @override
  State<AnimatedLoginImage> createState() => _AnimatedLoginImageState();
}

class _AnimatedLoginImageState extends State<AnimatedLoginImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenSize(context, 24.h, 26.h, 32.h),
      child: RiveAnimation.asset(
        'assets/images/animated_login_screen.riv',
        animations: const ['success'],
        fit: BoxFit.cover,
        controllers: [widget.controller1],
      ),
    );
  }
}
