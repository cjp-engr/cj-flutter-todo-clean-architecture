import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/animated_login_image.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/widget/have_an_account_button.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/widget/signup_button.dart';
import 'package:todo_app_clean_arch/injection.dart';
import 'package:validators/validators.dart';

class SignupPageWrapperProvider extends StatelessWidget {
  const SignupPageWrapperProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupBloc>(),
      child: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();

  String? _name, _email, _password;
  late RiveAnimationController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = OneShotAnimation('idle');
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenSize(context, 5.w, 17.w, 37.w)),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  AnimatedLoginImage(controller1: _controller1),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name required';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
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
                    controller: _passwordController,
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
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (String? value) {
                      if (_passwordController.text != value) {
                        return 'Passwords not match';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        SizeConfig.screenSize(context, 4.w, 5.w, 1.w)),
                    child: const Text(
                        'By registering, you are agreeing to our Terms of use and Privacy Policy.'),
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is SignupStateAuthenticating) {
                        return SignupButton(
                            text: 'SIGNING UP...', onTap: (() => null));
                      }

                      if (state is SignupStateError) {
                        log(state.message);
                      }

                      if (state is SignupStateAuthenticated) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          context.go('/${AppRoute.todo}');
                        });
                      }

                      return SignupButton(text: 'SIGN UP', onTap: _submit);
                    },
                  ),
                  SizedBox(
                      height: SizeConfig.screenSize(context, 1.h, 1.h, 1.h)),
                  const HaveAnAccountButton(),
                  // MemberSigninButton(),
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
    context.read<SignupBloc>().add(GetNewUserCredentials(
        name: _name!, email: _email!, password: _password!));
  }
}
