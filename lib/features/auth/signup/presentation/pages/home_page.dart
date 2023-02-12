import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/primary_button.dart';
import 'package:todo_app_clean_arch/core/widgets/secondary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenSize(context, 80.w, 20.w, 20.w),
              height: SizeConfig.screenSize(context, 60.h, 20.h, 20.h),
              color: Colors.red,
            ),
            SizedBox(height: SizeConfig.screenSize(context, 2.h, 1.h, 1.h)),
            PrimaryButton(
                text: 'LOGIN',
                onTap: () => context.go('/${AppRoute.signin}'),
                buttonWidth: SizeConfig.screenSize(context, 80.w, 20.w, 20.w),
                buttonHeight: SizeConfig.screenSize(context, 7.h, 8.h, 8.h)),
            SizedBox(height: SizeConfig.screenSize(context, 1.h, 1.h, 1.h)),
            SecondaryButton(
                text: 'SIGN UP',
                onTap: () => context.go('/${AppRoute.signup}'),
                buttonWidth: SizeConfig.screenSize(context, 80.w, 20.w, 20.w),
                buttonHeight: SizeConfig.screenSize(context, 7.h, 8.h, 8.h))
          ],
        ),
      ),
    );
  }
}
