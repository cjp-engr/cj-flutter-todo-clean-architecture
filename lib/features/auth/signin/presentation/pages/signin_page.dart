import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/animated_login_image.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/bloc/signin_bloc.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/widgets/forgot_password_button.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/widgets/no_account_button.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/widgets/remember_me_checkbox.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/widgets/signin_button.dart';
import 'package:todo_app_clean_arch/injection.dart';
import 'package:validators/validators.dart';

class SigninPageWrapperProvider extends StatelessWidget {
  const SigninPageWrapperProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SigninBloc>(),
      child: const SigninPage(),
    );
  }
}

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _email, _password;
  late RiveAnimationController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = OneShotAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenSize(context, 5.w, 17.w, 37.w),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  AnimatedLoginImage(
                      controller1: _controller1,
                      height: SizeConfig.screenSize(context, 24.h, 26.h, 32.h)),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email required';
                      }
                      if (!isEmail(value.trim())) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password required';
                      }
                      if (value.trim().length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _password = value;
                    },
                  ),
                  Row(
                    children: const [
                      RememberMeCheckbox(),
                      ForgotPasswordButton(),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // SigninButton(text: 'LOGIN', onTap: _submit),
                  BlocBuilder<SigninBloc, SigninState>(
                      builder: (context, state) {
                    if (state is SigninStateAuthenticating) {
                      return SigninButton(
                          text: 'LOGGING IN...', onTap: (() => null));
                    }

                    if (state is SigninStateError) {
                      log(state.message);
                    }

                    if (state is SigninStateAuthenticated) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.go('/${AppRoute.bottomNavigationBar}');
                      });
                    }
                    return SigninButton(text: 'LOGIN', onTap: _submit);
                  }),
                  SizedBox(
                      height: SizeConfig.screenSize(context, 1.h, 1.h, 1.h)),
                  const NoAccountButton()
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
      _controller1.isActive = false;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) {
      _controller1.isActive = true;
      return;
    }

    form.save();
    context
        .read<SigninBloc>()
        .add(GetExistingUserCredentials(email: _email!, password: _password!));
  }
}
