import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_clean_arch/features/signup/presentation/pages/signup_page.dart';
import 'package:todo_app_clean_arch/features/todo/presentation/pages/todo_page.dart';

class AppRoute {
  static const String home = '/';
  static const String todo = 'todo';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupPageWrapperProvider();
        },
        routes: <RouteBase>[
          GoRoute(
            path: todo,
            builder: (BuildContext context, GoRouterState state) {
              return const TodoPage();
            },
          ),
        ],
      ),
    ],
  );
}
