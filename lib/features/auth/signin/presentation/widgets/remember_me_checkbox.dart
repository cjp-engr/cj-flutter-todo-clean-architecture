import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    bool checkedValue = true;
    return Expanded(
      child: CheckboxListTile(
        title: Transform.translate(
            offset: const Offset(-20, 0),
            child: AutoSizeText(
              'Remember Me',
              style: TextStyle(
                  color: themeData.colorScheme.secondary,
                  fontWeight: FontWeight.w700),
            )),
        value: checkedValue,
        onChanged: (newValue) {
          // setState(() {
          //   checkedValue = newValue!;
          // });
        },
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
