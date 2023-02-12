import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/animated_login_image.dart';
import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';
import 'package:todo_app_clean_arch/core/widgets/secondary_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RiveAnimationController _controller1;

  @override
  void initState() {
    _controller1 = OneShotAnimation('idle');
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedLoginImage(
                controller1: _controller1,
                height: SizeConfig.screenSize(context, 80.h, 26.h, 32.h)),
            SizedBox(height: SizeConfig.screenSize(context, 1.h, 1.h, 1.h)),
            Center(
              child: Column(
                children: [
                  SizedBox(
                      height: SizeConfig.screenSize(context, 30.h, 1.h, 1.h)),
                  Text(
                    'Todoodle',
                    style: TextStyle(
                        color: themeData.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenSize(
                            context, 50.sp, 10.sp, 10.sp)),
                  ),
                  SizedBox(
                      height: SizeConfig.screenSize(context, 30.h, 1.h, 1.h)),
                  PrimaryButton(
                      text: 'LOGIN',
                      onTap: () => context.go('/${AppRoute.signin}'),
                      buttonWidth:
                          SizeConfig.screenSize(context, 80.w, 20.w, 20.w),
                      buttonHeight:
                          SizeConfig.screenSize(context, 7.h, 8.h, 8.h)),
                  SizedBox(
                      height: SizeConfig.screenSize(context, 1.h, 1.h, 1.h)),
                  SecondaryButton(
                      text: 'SIGN UP',
                      onTap: () => context.go('/${AppRoute.signup}'),
                      buttonWidth:
                          SizeConfig.screenSize(context, 80.w, 20.w, 20.w),
                      buttonHeight:
                          SizeConfig.screenSize(context, 7.h, 8.h, 8.h))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
