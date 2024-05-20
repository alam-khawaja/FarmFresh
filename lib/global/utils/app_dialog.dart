import 'package:farm_your_food/generated/assets.dart';
import 'package:farm_your_food/global/customs/widgets/animated_dialog_box.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppDialog {
  AppDialog._();
  static void showErrorDialog({
    required String message,
    String title = "Oops!",
  }) {
    var dialogContext = Get.context!;
    animatedDialog(
      dialogContext,
      button1Text: "Done",
      title: title,
      description: "\n $message",
      onTapButton1: () => Navigator.of(dialogContext).pop(),
      image: Assets.circle,
      icon: Assets.error,
      barrierDismissible: true,
    );
  }
}
