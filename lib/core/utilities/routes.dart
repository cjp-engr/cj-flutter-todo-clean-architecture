import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_clean_arch/features/auth/signin/presentation/pages/signin_page.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/pages/home_page.dart';
import 'package:todo_app_clean_arch/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:todo_app_clean_arch/features/todo/presentation/pages/todo_page.dart';

class AppRoute {
  static const String home = '/';
  static const String todo = 'todo';
  static const String signin = 'signin';
  static const String signup = 'signup';
  static const String forgotPassword = 'forgot-password';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: signup,
            builder: (BuildContext context, GoRouterState state) {
              return const SignupPageWrapperProvider();
            },
          ),
          GoRoute(
            path: signin,
            builder: (BuildContext context, GoRouterState state) {
              return const SigninPageWrapperProvider();
            },
          ),
          GoRoute(
            path: forgotPassword,
            builder: (BuildContext context, GoRouterState state) {
              return const Placeholder();
            },
          ),
          GoRoute(
            path: todo,
            builder: (BuildContext context, GoRouterState state) {
              return const TodoPageWrapperProvider();
            },
          ),
        ],
      ),
    ],
  );
}
