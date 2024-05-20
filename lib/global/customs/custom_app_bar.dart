import 'package:farm_your_food/app/local_storage/local_storage.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../generated/assets.dart';
import '../constants/color_constants.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onProfilePhotoTap;
  final String title;
  final double? titleFontSize;

  const CustomAppBar(
      {this.onTap,
      this.onProfilePhotoTap,
      required this.title,
      this.titleFontSize = 15.0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: Get.height * 0.3,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: onTap,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.power_settings_new,
                        color: kWhiteColor,
                      ),
                    )),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Hello, ",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(title,
                        maxLines: 2,
                        style: const TextStyle(
                            color: kTertiaryColor,
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(flex: 2, child: SizedBox()),
                  CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: onProfilePhotoTap,
                      child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: kPrimaryColor,
                            backgroundImage: AssetImage(Assets.man),
                          ))),
                  10.horizontalSpace,
                  LocalStorage.getAccountType() == UserRole.consumer.name
                      ? CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Get.toNamed(Routes.order);
                          },
                          child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: kWhiteColor,
                                child: Icon(Icons.shopping_cart_rounded,
                                    color: kSecondaryColor),
                              )))
                      : 0.verticalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration customDecoration() {
    return const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ));
  }
}
