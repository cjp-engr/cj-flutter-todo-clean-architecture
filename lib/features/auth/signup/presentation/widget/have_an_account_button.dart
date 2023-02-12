import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/custom_text_button.dart';

class HaveAnAccountButton extends StatelessWidget {
  const HaveAnAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        CustomTextButton(
          textButton: 'Login',
          onTap: () => context.go('/${AppRoute.signin}'),
        )
      ],
    );
  }
}
