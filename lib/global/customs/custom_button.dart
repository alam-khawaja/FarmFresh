import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Color? titleColor;
  final String title;
  final double? circular;
  final void Function()? onPressed;
  const CustomButton(
      {required this.height,
      required this.width,
      required this.color,
      this.titleColor,
      required this.onPressed,
      required this.title,
      this.circular,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CupertinoButton(
        onPressed: onPressed,
        color: color,
        borderRadius: BorderRadius.circular(circular ?? 12.0),
        child: Text(
          title,
          maxLines: 1
          ,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bold.copyWith(
            fontSize: 14,
            color: titleColor ?? Colors.white,
            letterSpacing: 1,
            
          ),
        ),
      ),
    );
  }
}
