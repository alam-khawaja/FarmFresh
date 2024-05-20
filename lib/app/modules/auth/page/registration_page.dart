import 'package:farm_your_food/app/modules/auth/controllers/registration_screen_controller.dart';
import 'package:farm_your_food/generated/assets.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/custom_button.dart';
import 'package:farm_your_food/global/customs/custom_text_field.dart';
import 'package:farm_your_food/global/customs/widgets/logo.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:farm_your_food/global/validations/validation.dart';
import 'package:farm_your_food/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetView<RegistrationScreenController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?",
                style: TextStyle(color: Colors.black)),
            const SizedBox(width: 2),
            Obx(
              () => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : () {
                          Get.back();
                        },
                  child: const Text("Login",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500))),
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
                    logo(),
                    SizedBox(height: Get.height * 0.04),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text("Register yourself ",
                              style: AppTextStyles.loginFontsStyle
                                  .copyWith(color: kSecondaryColor)),
                        ),
                        Expanded(
                          child: Image.asset(Assets.plant),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Text("Join for free", style: AppTextStyles.semiBold),
                    SizedBox(height: Get.height * 0.03),
                    //selectImage(),
                    20.verticalSpace,
                    CustomTextField(
                      controller: controller.nameController,
                      placeHolder: "Full name",
                      validator: (value) {
                        value = Validations.nameValidation(value);
                        return value;
                      },
                      prefix:
                          SvgPicture.asset(Assets.user, color: kSecondaryColor),
                    ),
                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.emailController,
                      validator: (value) =>
                          Validations.emailValidationWidthDomain(
                                  controller.emailController.text)
                              ? null
                              : "Enter valid email",
                      placeHolder: "Email",
                      prefix: SvgPicture.asset(Assets.message,
                          color: kSecondaryColor),
                    ),

                    SizedBox(height: Get.height * 0.023),
                    CustomTextField(
                      controller: controller.phoneController,
                      placeHolder: "+92",
                      keyboardType: TextInputType.phone,
                      // prefixWidth: Get.width * 0.2,
                      onChanged: (value) {},
                      validator: (value) => Validations.commonValidation(value,
                          length: 13, message2: "Enter valid phone number"),
                      prefix: SvgPicture.asset(Assets.phone,
                          color: kSecondaryColor),
                    ),

                    SizedBox(height: Get.height * 0.023),
                    Obx(
                      () => CustomTextField(
                        controller: controller.passwordController,
                        placeHolder: "Password",
                        validator: (value) =>
                            Validations.passwordValidation(value),
                        prefix: SvgPicture.asset(Assets.lock,
                            color: kSecondaryColor),
                        obscureText: controller.obscureText.value,
                        suffix: InkWell(
                            onTap: () => controller.obscureText.value =
                                !controller.obscureText.value,
                            child: controller.obscureText.value
                                ? const Icon(Icons.visibility_off,
                                    size: 18, color: kSecondaryColor)
                                : const Icon(Icons.visibility,
                                    size: 18, color: kSecondaryColor)),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.023),
                    Obx(
                      () => CustomTextField(
                        controller: controller.confirmPasswordController,
                        placeHolder: "Confirm Password",
                        validator: (value) =>
                            Validations.commonValidation(value) == null
                                ? null
                                : "Enter confirm password",
                        prefix: SvgPicture.asset(Assets.lock,
                            color: kSecondaryColor),
                        obscureText: controller.confirmObscureText.value,
                        suffix: InkWell(
                            onTap: () => controller.confirmObscureText.value =
                                !controller.confirmObscureText.value,
                            child: controller.confirmObscureText.value
                                ? const Icon(Icons.visibility_off,
                                    size: 18, color: kSecondaryColor)
                                : const Icon(Icons.visibility,
                                    size: 18, color: kSecondaryColor)),
                      ),
                    ),
                    Obx(() => controller.confirmPassword.value == ''
                        ? const SizedBox()
                        : Text(
                            controller.confirmPassword.value,
                            style: const TextStyle(color: Colors.red),
                          )),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => CustomButton(
                          title: "Signup",
                          height: Get.height * 0.07,
                          width: Get.width * 9,
                          color: kSecondaryColor,
                          circular: 30.0,
                          onPressed: controller.isLoading.value
                              ? null
                              : () => {controller.signup()}),
                    ),
                    SizedBox(height: Get.height * 0.05),
                  ],
                ),
              ),
            ),
          ),
          Obx(() => controller.isLoading.value
              ? const Center(child: LoadingOverlay())
              : const SizedBox()), // Show the LoadingOverlay if isLoading is true
        ],
      ),
    );
  }

  Widget selectImage() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => controller.pickImage(),
            child: Obx(
              () => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: controller.image.value.toString() != "File: ''"
                          ? FileImage(controller.image.value)
                              as ImageProvider<Object>
                          : const AssetImage(Assets.dashedCircle),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Icon(Icons.add,
                      color: Colors.grey.withOpacity(0.4), size: 24),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Text("Upload the \n Profile image",
              textAlign: TextAlign.center,
              style: AppTextStyles.normal
                  .copyWith(fontSize: 12, letterSpacing: 0.1)),
        ],
      ),
    );
  }
}
