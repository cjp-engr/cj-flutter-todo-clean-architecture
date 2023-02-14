import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/features/main/add_todo/presentation/widgets/add_todo_dialog.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextButton(
      onPressed: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const AddTodoDialog();
            });
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            SizeConfig.screenSize(context, 10.w, 1.w, 1.w),
            SizeConfig.screenSize(context, 10.w, 1.w, 1.w),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(themeData.colorScheme.secondary),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Icon(
        Icons.add,
        color: themeData.colorScheme.onPrimary,
        size: 5.w,
      ),
    );
  }
}
