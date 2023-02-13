import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/routes.dart';
import 'package:todo_app_clean_arch/core/widgets/header_text.dart';
import 'package:todo_app_clean_arch/features/main/add_todo/presentation/widgets/add_todo_button.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(5.w),
                child: HeaderText(
                    text: 'Add Todo', color: themeData.colorScheme.secondary),
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: const AddTodoButton(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
