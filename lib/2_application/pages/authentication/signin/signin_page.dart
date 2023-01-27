import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('BACKKK')),
          ),
          body: SizedBox(child: Text('Hellooo Worlddd')),
        ),
      ),
    );
  }
}
