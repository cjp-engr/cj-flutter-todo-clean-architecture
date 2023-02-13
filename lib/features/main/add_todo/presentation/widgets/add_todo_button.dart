import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/header_text.dart';
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
                titlePadding: const EdgeInsets.all(0),
                contentPadding: const EdgeInsets.all(0),
                title: Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.secondary,
                      border:
                          Border.all(color: themeData.colorScheme.secondary)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CloseButton(),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: const ProfileButton(),
                      )
                    ],
                  ),
                ),
                content: SizedBox(
                  height: 95.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      Container(
                        height: 18.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30)),
                            color: themeData.colorScheme.secondary),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              HeaderText(
                                  text: 'Title',
                                  color: themeData.colorScheme.onPrimary),
                              SizedBox(height: 2.h),
                              const TextField()
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.secondary),
                          ),
                          Container(
                            height: 68.h,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30)),
                                color: themeData.colorScheme.onPrimary),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h),
                                  AutoSizeText('Date and Time',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2.h),
                                  Container(
                                    height: 14.h,
                                    color: themeData.colorScheme.secondary,
                                  ),
                                  SizedBox(height: 2.h),
                                  AutoSizeText('Note',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2.h),
                                  Container(
                                    height: 14.h,
                                    color: themeData.colorScheme.secondary,
                                  ),
                                  SizedBox(height: 2.h),
                                  Container(
                                    height: 8.h,
                                    color: themeData.colorScheme.secondary,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            AutoSizeText(
                                              'Color',
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text('Testtt'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            AutoSizeText(
                                              'Alarm',
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text('Testtt'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Container(
                                    height: 10.h,
                                    color: themeData.colorScheme.onPrimary,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Container(
                                          height: 10.h,
                                          width: 30.w,
                                          color:
                                              themeData.colorScheme.secondary,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
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
