// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedLoginImage extends StatefulWidget {
  final RiveAnimationController controller1;
  final double height;
  const AnimatedLoginImage({
    Key? key,
    required this.controller1,
    required this.height,
  }) : super(key: key);

  @override
  State<AnimatedLoginImage> createState() => _AnimatedLoginImageState();
}

class _AnimatedLoginImageState extends State<AnimatedLoginImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: RiveAnimation.asset(
        'assets/images/animated_login_screen.riv',
        animations: const ['success'],
        fit: BoxFit.cover,
        controllers: [widget.controller1],
      ),
    );
  }
}
