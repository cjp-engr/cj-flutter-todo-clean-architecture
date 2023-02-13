import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/profile_button.dart';

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
              return AlertDialog(
                insetPadding: EdgeInsets.all(
                    SizeConfig.screenSize(context, 2.w, 2.w, 2.w)),
                titlePadding: EdgeInsets.all(
                    SizeConfig.screenSize(context, 2.w, 2.w, 2.w)),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close)),
                    const ProfileButton()
                  ],
                ),
                content: SizedBox(
                  height: 95.h,
                  width: 100.w,
                ),
              );
            });
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(
            SizeConfig.screenSize(context, 5.w, 1.w, 1.w),
            SizeConfig.screenSize(context, 5.w, 1.w, 1.w))),
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
