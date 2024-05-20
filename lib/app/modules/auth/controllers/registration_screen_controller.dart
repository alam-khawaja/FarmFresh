// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/controllers/user_controller.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../generated/assets.dart';
import '../../../../global/constants/pick_image.dart';
import '../../../../global/customs/widgets/animated_dialog_box.dart';
import '../../../services/common_services.dart';
import '../../../routes/app_routes.dart';
import '../../../models/user_model.dart';

class RegistrationScreenController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController referredByController = TextEditingController();

  RxString confirmPassword = ''.obs;
  RxString photoUrl = ''.obs;
  UserRole accountType = UserRole.none;
  RxBool obscureText = true.obs;
  RxBool confirmObscureText = true.obs;
  RxBool isLoading = false.obs;
  RxBool validationError = false.obs;

  Rx<File> image = File("").obs;

  TextEditingController nameController = TextEditingController();
  final phoneController = MaskedTextController(mask: '+00 0000 000000');

  void signup() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        confirmPassword.value = "Confirm password did not match";
      } else {
        confirmPassword.value = '';
        try {
          isLoading.value = true;
          if (image.value.path != "") {
            photoUrl.value = await CommonServices.uploadImage(image.value);
          }

          User user = await authController.createUserWithEmail(
            emailController.text,
            passwordController.text,
          );
          UserModel userModel = UserModel(
            uid: user.uid,
            userName: nameController.text,
            email: emailController.text.toLowerCase(),
            phoneNo: phoneController.text,
            role: accountType,
            createdAt: Timestamp.now(),
            password: passwordController.text,
            profileAvatar: photoUrl.value,
          );

          await userController.createUser(userModel);

          isLoading.value = false;
          showDialog();
        } catch (e) {
          isLoading.value = false;
          showErrorDialog(e.toString());
        }
      }
    }
  }

  void showDialog() {
    var dialogContext = Get.context!;
    animatedDialog(
      dialogContext,
      button1Text: "Done",
      title: "Submitted",
      description: "You Have Successfully created your account. Please login",
      onTapButton1: () {
        Get.back();
        Get.offAllNamed(Routes.login);
      },
      image: Assets.circle,
      icon: Assets.verify,
      barrierDismissible: false,
    );
  }

  void showErrorDialog(String message) {
    var dialogContext = Get.context!;
    animatedDialog(
      dialogContext,
      button1Text: "Done",
      title: "Oops!",
      description: "\n $message",
      onTapButton1: () => Navigator.of(dialogContext).pop(),
      image: Assets.circle,
      icon: Assets.error,
      barrierDismissible: true,
    );
  }

  void pickImage() async {
    XFile? pickedFile = await selectImage();
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      photoUrl.value = '';
    }
  }

  @override
  void onInit() {
    accountType = UserRole.fromString(Get.arguments)!;
    phoneController.updateText('+92');
    super.onInit();
  }
}
