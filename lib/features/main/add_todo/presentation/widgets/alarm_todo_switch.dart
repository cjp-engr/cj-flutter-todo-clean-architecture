import 'package:flutter/material.dart';

class AlarmTodoSwitch extends StatefulWidget {
  const AlarmTodoSwitch({super.key});

  @override
  State<AlarmTodoSwitch> createState() => _AlarmTodoSwitchState();
}

class _AlarmTodoSwitchState extends State<AlarmTodoSwitch> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Switch(
      value: light,
      activeColor: themeData.colorScheme.secondary,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
