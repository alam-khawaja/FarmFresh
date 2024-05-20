import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/customs/widgets/dashboard_card.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:farm_your_food/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/assets.dart';
import '../../routes/app_routes.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: Get.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.1),
                Image.asset(Assets.logo2),
                10.verticalSpace,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Register as:",
                        style: AppTextStyles.medium
                            .copyWith(fontSize: 25, color: kSecondaryColor))),
                30.verticalSpace,
                showDetailCard(
                    title: "Farmer",
                    detail: "Sell your Natural Goods",
                    height: Get.height * 0.17,
                    image: Assets.trackter,
                    onTap: () {
                      Get.toNamed(Routes.signup, arguments: "farmer");
                    }),
                15.verticalSpace,
                showDetailCard(
                    title: "Consumer",
                    detail: "Buy Natural Goods and evaluate price Prediction's",
                    height: Get.height * 0.17,
                    image: Assets.girl,
                    onTap: () {
                      Get.toNamed(Routes.signup, arguments: "consumer");
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
