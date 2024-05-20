import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:farm_your_food/app/repository/user_repository.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/routes/app_routes.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:farm_your_food/global/utils/app_dialog.dart';
import 'package:farm_your_food/global/utils/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool rememberMe = false.obs;
  RxBool isSelected = false.obs;

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await authController.signInUserWithEmail(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (authController.userLoggedIn) {
          await Get.find<UserController>().initCurrentUser();
          navigateUser();
        }

        isLoading.value = false;
      } on AppException catch (e) {
        isLoading.value = false;
        AppDialog.showErrorDialog(message: e.message);
      }
    }
  }

  void navigateUser() async {
    UserRole? userRole = await getUserRole(authController.user!.uid);
    if (userRole == UserRole.consumer) {
      Get.offAllNamed(Routes.consumerDashboard);
    } else if (userRole == UserRole.farmer) {
      Get.offAllNamed(Routes.farmerDashboard);
    } else {
      AppDialog.showErrorDialog(message: "Unknown user role");
    }
  }

  Future<UserRole?> getUserRole(String uid) async {
    try {
      final user = await UserRepository.getUser(uid);
      return user?.role;
    } catch (e) {
      AppDialog.showErrorDialog(message: "Failed to get user role: $e");
      return null;
    }
  }
}
