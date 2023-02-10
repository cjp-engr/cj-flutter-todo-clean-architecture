import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app_clean_arch/features/signup/presentation/pages/signup_page.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/theme.dart';

import 'core/services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            debugShowCheckedModeBanner: false,
            themeMode:
                themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            // home: const Placeholder(),
            home: const SignupPageWrapperProvider(),
            routes: {
              SignupPage.routeName: (context) => const SignupPage(),
              // SigninPage.routeName: (context) => const SigninPage(),
            },
          );
        },
      );
    });
  }
}
