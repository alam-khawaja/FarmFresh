import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../constants/color_constants.dart';
import '../../utils/app_text_styles.dart';

animatedDialog(BuildContext dialogContext,
    {icon,
    image,
    title,
    barrierDismissible,
    description,
    button1Text,
    backButton1Title,
    backButton2Title,
    void Function()? onTapButton1,
    void Function()? onTapBackButton2}) {
  return showGeneralDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (dialogContext, a1, a2, widget) {
        final curvedValue = Curves.easeInOutSine.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: backButton2Title != null
                    ? Get.height * 0.45
                    : Get.height * 0.4,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.contain,
                              image: image != null
                                  ? AssetImage(
                                      image,
                                    )
                                  : const AssetImage(
                                      Assets.splashLogo,
                                    ),
                            )),
                            child: icon != null
                                ? Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: SvgPicture.asset(icon,
                                          height: 35,
                                          width: 35,
                                          color: kSecondaryColor),
                                    ),
                                  )
                                : const SizedBox()),
                        const SizedBox(height: 16.0),
                        Text(
                          title,
                          style: AppTextStyles.bold.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        description != null
                            ? Text(
                                description!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: AppTextStyles.normal.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            : 0.verticalSpace,
                        const SizedBox(height: 30.0),
                        backButton1Title != null
                            ? backButton1(dialogContext,
                                backButton1Title: backButton1Title)
                            : button1(dialogContext,
                                onTapButton1: onTapButton1,
                                button1Text: button1Text),
                        backButton2Title != null
                            ? 10.verticalSpace
                            : 0.verticalSpace,
                        backButton2Title != null
                            ? backButton2(dialogContext,
                                backButton2Title: backButton2Title,
                                onTapBackButton2: onTapBackButton2)
                            : 0.verticalSpace,
                      ]),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      barrierLabel: '',
      context: dialogContext,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}

Widget backButton1(BuildContext buildContext, {backButton1Title}) {
  return InkWell(
      onTap: () {
        Navigator.of(buildContext).pop();
      },
      child: Container(
          height: Get.height * 0.045,
          width: Get.width * 9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(backButton1Title,
                style: AppTextStyles.bold
                    .copyWith(fontSize: 12, color: kSecondaryColor)),
          )));
}

Widget backButton2(BuildContext buildContext,
    {backButton2Title, void Function()? onTapBackButton2}) {
  return InkWell(
      onTap: onTapBackButton2,
      child: Container(
          height: Get.height * 0.045,
          width: Get.width * 9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.white)),
          child: Center(
            child: Text(backButton2Title,
                style: AppTextStyles.bold.copyWith(
                    fontSize: 13, color: Colors.white, letterSpacing: 2)),
          )));
}

Widget button1(BuildContext buildContext,
    {void Function()? onTapButton1, button1Text}) {
  return InkWell(
      onTap: onTapButton1,
      child: Container(
          height: Get.height * 0.05,
          width: Get.width * 9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(button1Text,
                style: AppTextStyles.bold.copyWith(
                    fontSize: 13, color: kSecondaryColor, letterSpacing: 2)),
          )));
}
