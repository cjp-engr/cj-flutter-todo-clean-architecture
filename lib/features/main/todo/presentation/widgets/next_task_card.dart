import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app_clean_arch/core/utilities/test.dart';

class NextTaskCard extends StatelessWidget {
  const NextTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: SizedBox(
        height: 33.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: themeData.colorScheme.onPrimary.withOpacity(0.7),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            width: 5, color: themeData.colorScheme.secondary))),
                width: 41.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      AutoSizeText(Test.test1,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 3.h),
                      AutoSizeText(Test.test2,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: themeData.colorScheme.primary)),
                      SizedBox(height: 3.h),
                      AutoSizeText('Hello World',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
