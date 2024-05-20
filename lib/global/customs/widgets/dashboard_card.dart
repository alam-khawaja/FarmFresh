import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/models/product_model.dart';
import '../../../generated/assets.dart';
import '../../constants/color_constants.dart';
import '../../utils/app_text_styles.dart';

class DashboardCard extends StatelessWidget {
  final String? image;
  final String title;
  final double? width;
  final String? pngImage;
  final VoidCallback? onTap;
  final Color textColor;
  final double horizontalPadding;

  const DashboardCard(
      {this.image,
      required this.title,
      this.onTap,
      this.pngImage,
      this.width,
      this.textColor = kBlackColor,
      this.horizontalPadding = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    final dynamicImage = Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: pngImage != null
          ? Image.asset(pngImage!)
          : SvgPicture.asset(
              image!,
            ),
    );

    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: width ?? Get.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                20.verticalSpace,
                Expanded(
                    flex: 2,
                    child:
                        SizedBox(height: 80, width: 80, child: dynamicImage)),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Center(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowProductDetailsCard extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final bool? isOrderScreen;
  final String? productImage;

  final ProductModel? productDetailsModel;

  const ShowProductDetailsCard(
      {this.height,
      this.width,
      this.onTap,
      this.productDetailsModel,
      this.isOrderScreen,
      this.productImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        height: height ?? Get.size.height * 0.07,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: Column(),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      productImage ?? Assets.girl,
                      height: 100,
                      width: 100,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget showDetailCard(
    {title, detail, width, height, image, final VoidCallback? onTap}) {
  return CupertinoButton(
    minSize: 0,
    padding: EdgeInsets.zero,
    onPressed: onTap,
    child: Container(
      height: height ?? Get.size.height * 0.07,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppTextStyles.medium
                            .copyWith(fontSize: 25, color: kSecondaryColor)),
                    5.verticalSpace,
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(detail,
                            style: AppTextStyles.normal.copyWith(
                                fontSize: 14, color: kSecondaryColor))),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    image,
                    height: 100,
                    width: 100,
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
