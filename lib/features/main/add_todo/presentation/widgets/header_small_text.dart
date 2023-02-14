// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderSmallText extends StatelessWidget {
  final String text;
  const HeaderSmallText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold));
  }
}
