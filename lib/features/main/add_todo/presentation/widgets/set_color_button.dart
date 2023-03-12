import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

List<String> colors = ['amber', 'blue', 'red'];

class SetColorButton extends StatefulWidget {
  const SetColorButton({super.key});

  @override
  State<SetColorButton> createState() => _SetColorButtonState();
}

class _SetColorButtonState extends State<SetColorButton> {
  Map<String, bool> buttonSelected = {
    colors[0]: true,
    colors[1]: false,
    colors[2]: false
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: 40.w,
      child: Row(
        children: [
          _textButton(0, buttonSelected[colors[0]]!),
          _textButton(1, buttonSelected[colors[1]]!),
          _textButton(2, buttonSelected[colors[2]]!),
        ],
      ),
    );
  }

  TextButton _textButton(int c, bool isSelected) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (c == 0) {
            buttonSelected = {
              colors[0]: true,
              colors[1]: false,
              colors[2]: false
            };
          } else if (c == 1) {
            buttonSelected = {
              colors[0]: false,
              colors[1]: true,
              colors[2]: false
            };
          } else {
            buttonSelected = {
              colors[0]: false,
              colors[1]: false,
              colors[2]: true
            };
          }
        });
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.zero),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(0),
        ),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Icon(
          Icons.circle,
          color: c == 0
              ? Colors.amber
              : c == 1
                  ? Colors.blue
                  : Colors.red,
          size: 8.w,
        ),
        isSelected
            ? const Icon(Icons.check, color: Colors.black)
            : const SizedBox(),
      ]),
    );
  }
}
