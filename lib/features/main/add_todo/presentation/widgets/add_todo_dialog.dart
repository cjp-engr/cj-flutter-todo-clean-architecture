import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/size_config.dart';
import 'package:todo_app_clean_arch/core/widgets/header_text.dart';
import 'package:todo_app_clean_arch/features/main/add_todo/presentation/widgets/header_small_text.dart';
import 'package:todo_app_clean_arch/features/main/add_todo/presentation/widgets/save_todo_button.dart';
import 'package:todo_app_clean_arch/features/main/add_todo/presentation/widgets/set_date_time_button.dart';
import 'package:todo_app_clean_arch/features/main/todo/presentation/widgets/profile_button.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _title, _note;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: AlertDialog(
          insetPadding:
              EdgeInsets.all(SizeConfig.screenSize(context, 2.w, 2.w, 2.w)),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.secondary,
                border: Border.all(
                    width: 10, color: themeData.colorScheme.secondary)),
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
            child: ListView(
              shrinkWrap: true,
              reverse: true,
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
                        TextFormField(
                          autocorrect: false,
                          decoration: const InputDecoration(
                            labelText: 'Sleep all day',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Title is required';
                            }

                            return null;
                          },
                          onSaved: (String? value) {
                            _title = value;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 25.h,
                      decoration:
                          BoxDecoration(color: themeData.colorScheme.secondary),
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
                            const HeaderSmallText(text: 'Date and Time'),
                            SizedBox(height: 2.h),
                            SizedBox(
                              height: 15.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 9.h,
                                    color: themeData.colorScheme.secondary,
                                  ),
                                  SizedBox(height: 1.h),
                                  SizedBox(
                                    height: 5.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 1.w),
                                        SetDateTimeButton(onTap: () {}),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            const HeaderSmallText(text: 'Note'),
                            SizedBox(height: 2.h),
                            SizedBox(
                              height: 14.h,
                              child: TextFormField(
                                autocorrect: false,
                                decoration: const InputDecoration(
                                    labelText:
                                        'Sleep all day because I am broken hearted',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    alignLabelWithHint: true),
                                maxLines: 4,
                                onSaved: (String? value) {
                                  _note = value;
                                },
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              height: 8.h,
                              color: themeData.colorScheme.secondary,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      HeaderSmallText(text: 'Color'),
                                      Text('Testtt'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      HeaderSmallText(text: 'Alarm'),
                                      Text('Testtt'),
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
                                  SaveTodoButton(onTap: _submit)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) {
      return;
    }

    form.save();
    // ! Event to save inputs
  }
}
