import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';

class AddTodoPageWrapperProvider extends StatelessWidget {
  const AddTodoPageWrapperProvider({super.key});
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => sl<TodoBloc>(),
    //   child: const TodoPage(),
    // );
    return const AddTodoPage();
  }
}

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () =>
                            context.go('/${AppRoute.bottomNavigationBar}'),
                        child: const Icon(Icons.abc_outlined))
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                ),
              ),
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.onPrimary,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
