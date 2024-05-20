import 'dart:async';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../local_storage/local_storage.dart';
import '../../routes/app_routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      // Future.delayed(const Duration(seconds: 3), () {
      //   LocalStorage.isUserLoggedIn()
      //       ? Get.offAndToNamed(Routes.login)
      //       : Get.offAndToNamed(Routes.login);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: Container(
              height: Get.height * 1,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.introScreenBackground))),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 30),
                child: Align(alignment: Alignment.bottomRight, child: button()),
              )),
        ),
      ),
    );
  }

  Widget button() {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        LocalStorage.setIntro(true);
        Get.toNamed(Routes.login);
      },
      child: Container(
        height: 30,
        width: 110,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text("Get Started",
                style: AppTextStyles.normal
                    .copyWith(color: Colors.white, fontSize: 14))),
      ),
    );
  }
}
