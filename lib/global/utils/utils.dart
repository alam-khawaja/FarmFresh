import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void customToast(title, description) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: title == 'Error' ? Colors.red[400] : Colors.grey[800],
      colorText: Colors.white,
    );
  }
}
