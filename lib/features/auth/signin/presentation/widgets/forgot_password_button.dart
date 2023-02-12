import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/widgets/custom_text_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      textButton: 'Forgot Password?',
      onTap: () => context.go('/${AppRoute.forgotPassword}'),
    );
  }
}
