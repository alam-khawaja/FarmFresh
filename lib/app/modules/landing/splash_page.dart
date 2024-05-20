import 'dart:async';

import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:farm_your_food/app/routes/app_routes.dart';
import 'package:farm_your_food/generated/assets.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    if (authController.userLoggedIn) {
      await userController.getUser(authController.user!.uid);
      UserRole? userRole = userController.appUser.value?.role;
      if (userRole == UserRole.consumer) {
        Get.offAllNamed(Routes.consumerDashboard);
      } else if (userRole == UserRole.farmer) {
        Get.offAllNamed(Routes.farmerDashboard);
      } else {
        showErrorDialog("Unknown user role");
      }
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }

  void showErrorDialog(String message) {
    var dialogContext = Get.context!;
    showDialog(
      context: dialogContext,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(Assets.splashScreenBackGround, fit: BoxFit.cover),
      ),
    );
  }
}
