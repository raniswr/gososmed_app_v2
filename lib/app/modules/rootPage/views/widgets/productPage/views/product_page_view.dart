import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';

import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 500,
            decoration: const BoxDecoration(color: AppColors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rose.png'),
                  radius: 40,
                ),
                Container(
                  height: 80,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rose Blackpink',
                            style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 300,
                            decoration: const BoxDecoration(color: AppColors.white),
                            child: Text(
                              'Make your day more beautiful with',
                              style: AppStyles.styleTextBody16(colorText: AppColors.grayMedium),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '200k',
                        style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold, colorText: AppColors.yellow),
                      ).paddingSymmetric(vertical: 25)
                    ],
                  ),
                ).marginAll(5),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: const AppImage(
              asset: Assets.product,
              width: 150,
            ),
          ).paddingSymmetric(horizontal: 20),
          Text(
            'Description ',
            style: AppStyles.styleTextBody20(
              fontWeight: FontWeight.bold,
            ),
          ).paddingOnly(left: 5).paddingOnly(top: 8),
          Text(
            'This earing are made by the gold whit premium and, This earing are made by the gold whit premium and',
            style: AppStyles.styleTextBody16(colorText: AppColors.grayMedium),
          ).paddingOnly(left: 5),
          SizedBox(
            width: 500,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                // Get.toNamed(Routes.INTEREST_PAGE);
              },
              style: ButtonStyle(textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18(fontWeight: FontWeight.bold))),
              child: const Text("BUY"),
            ),
          ).paddingOnly(top: 20).paddingSymmetric(horizontal: 3)
        ],
      ).paddingAll(20),
    );
  }
}
