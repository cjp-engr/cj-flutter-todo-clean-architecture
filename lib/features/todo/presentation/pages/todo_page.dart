import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('test');
  }
}
