import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app_clean_arch/injection.dart';

class TodoPageWrapperProvider extends StatelessWidget {
  const TodoPageWrapperProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoBloc>(),
      child: const TodoPage(),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          SizeConfig.screenSize(context, 2.w, 1.w, 1.w)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('menu'),
                          Text('profile'),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Today'),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('test'),
                          Text('test'),
                          Text('test'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                ),
              ),
              Container(
                height: 50.h,
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
