import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
    // return BlocConsumer<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     if (state.authStatus == AuthStatus.unauthenticated) {
    //       Navigator.pushNamedAndRemoveUntil(context, SigninPage.routeName,
    //           (route) {
    //         return route.settings.name == ModalRoute.of(context)!.settings.name
    //             ? true
    //             : false;
    //       });
    //     } else if (state.authStatus == AuthStatus.authenticated) {
    //       Navigator.pushNamed(context, HomePage.routeName);
    //     }
    //   },
    //   builder: (context, state) {
    //     return const Scaffold(
    //       body: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   },
    // );
  }
}
