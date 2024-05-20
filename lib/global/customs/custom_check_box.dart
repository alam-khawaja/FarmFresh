import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  const CustomCheckBox(
      {required this.onTap, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return checkBox();
  }

  Widget checkBox() {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(4),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: isSelected ? kSecondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(
              color: kSecondaryColor,
              width: 1.5,
            )),
        width: 20,
        height: 20,
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              )
            : null,
      ),
    );
  }
}
