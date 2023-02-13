import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/add_todo_button.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/next_task_card.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/next_task_text.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/profile_button.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/settings_button.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/status_button.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/today_task_list.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/today_text.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/view_status_button.dart';
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          SizeConfig.screenSize(context, 2.w, 1.w, 1.w)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SettingsButton(),
                          ProfileButton(),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          SizedBox(width: 2.w),
                          const TodayText(),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TodayTaskList(),
                          StatusButton(status: 1),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TodayTaskList(),
                          StatusButton(status: 1),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TodayTaskList(),
                          StatusButton(status: 1),
                        ],
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
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
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SizedBox(width: 5.w),
                        const NextTaskText(),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ViewStatusButton(),
                        SizedBox(width: 47.w),
                        const AddTodoButton(),
                      ], // In Progress, Done, To do
                    ),
                    SizedBox(height: 2.h),
                    const NextTaskCard(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
