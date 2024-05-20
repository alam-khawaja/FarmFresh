import 'dart:ui';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        width: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(
            color: kSecondaryColor,
            strokeWidth: 4,
          ),
        ),
      ),
    );
  }
}
