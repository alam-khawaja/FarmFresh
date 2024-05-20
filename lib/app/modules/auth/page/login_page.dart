import 'package:farm_your_food/app/modules/auth/controllers/login_screen_controller.dart';
import 'package:farm_your_food/app/routes/app_routes.dart';
import 'package:farm_your_food/generated/assets.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/custom_button.dart';
import 'package:farm_your_food/global/customs/custom_check_box.dart';
import 'package:farm_your_food/global/customs/custom_text_field.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/validations/validation.dart';
import 'package:farm_your_food/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginScreenController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?",
                style: TextStyle(color: Colors.black)),
            GestureDetector(
              onTap: controller.isLoading.value
                  ? null
                  : () {
                      Get.toNamed(Routes.accountType);
                    },
              child: const Text(
                " Sign up",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    SizedBox(height: Get.height * 0.04),
                    Text("Login to your ",
                        style: AppTextStyles.loginFontsStyle.copyWith()),
                    const Text("Account ",
                        style: AppTextStyles.loginFontsStyle),
                    SizedBox(height: Get.height * 0.05),
                    CustomTextField(
                      controller: controller.emailController,
                      validator: (value) =>
                          Validations.emailValidationWidthDomain(
                                  controller.emailController.text)
                              ? null
                              : "Enter a valid email",
                      placeHolder: "Email",
                      prefix: SvgPicture.asset(Assets.message,
                          color: kSecondaryColor),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => CustomTextField(
                        controller: controller.passwordController,
                        placeHolder: "Password",
                        validator: (value) =>
                            Validations.passwordValidation(value),
                        prefix: SvgPicture.asset(Assets.lock,
                            color: kSecondaryColor),
                        obscureText: controller.obscureText.value,
                        suffix: Obx(
                          () => InkWell(
                              onTap: () => controller.obscureText.value =
                                  !controller.obscureText.value,
                              child: controller.obscureText.value
                                  ? const Icon(Icons.visibility_off,
                                      size: 18, color: kSecondaryColor)
                                  : const Icon(Icons.visibility,
                                      size: 18, color: kSecondaryColor)),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CustomButton(
                          title: "Login",
                          height: Get.height * 0.07,
                          width: Get.width * 9,
                          color: kSecondaryColor,
                          onPressed: controller.isLoading.value
                              ? null
                              : () => {
                                    FocusScope.of(context).unfocus(),
                                    controller.login(),
                                  }),
                    ),
                    const SizedBox(height: 20),
                    rememberMeAndForget(),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: LoadingOverlay(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget rememberMeAndForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => CustomCheckBox(
            onTap: () => controller.rememberMe(),
            isSelected: controller.isSelected.value,
          ),
        ),
        const Expanded(
          flex: 5,
          child: Text(
            "Remember me",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
