import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/2_application/pages/signup/signup_page.dart';
import 'package:todo_app_clean_arch/theme.dart';

import '2_application/core/services/theme_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            themeMode:
                themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            // home: const Placeholder(),
            home: SignupPage(),
            routes: {
              SignupPage.routeName: (context) => const SignupPage(),
            },
          );
        },
      );
    });
  }
}
