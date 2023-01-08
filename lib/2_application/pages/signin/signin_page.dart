import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:validators/validators.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({Key? key}) : super(key: key);

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
  void dispose() {
    _controller1.dispose();

    super.dispose();
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

    print('email: $_email, password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: RiveAnimation.asset(
                        'assets/images/animated_login_screen.riv',
                        animations: ['success'],
                        fit: BoxFit.cover,
                        controllers: [_controller1],
                      ),
                      width: double.infinity,
                      // height: mediaQueryLoginSignUpAnimation(
                      //   context: context,
                      // ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
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
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password required';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _password = value;
                      },
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign in'),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Not a member? Sign Up!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
