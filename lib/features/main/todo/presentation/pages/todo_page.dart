import 'package:flutter/material.dart';

class TodoPageWrapperProvider extends StatelessWidget {
  const TodoPageWrapperProvider({super.key});
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => sl<TodoBloc>(),
    //   child: const TodoPage(),
    // );
    return const TodoPage();
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
