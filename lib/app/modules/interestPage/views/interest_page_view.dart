import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';

import '../controllers/interest_page_controller.dart';

class InterestPageView extends GetView<InterestPageController> {
  const InterestPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          width: 500,
          height: 1000,
          decoration: const BoxDecoration(color: AppColors.white),
          child: Column(
            children: [
              const AppImage(asset: Assets.logoBlack, width: 100).marginOnly(top: 50),
              Text('Choose your interest', style: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold)).marginAll(5),
              Container(
                width: 500,
                height: 650,
                decoration: const BoxDecoration(color: AppColors.white),
                child: GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.heart, width: 40).marginAll(10),
                            Text(
                              'Love',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.game, width: 40).marginAll(10),
                            Text(
                              'Game',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.burger, width: 40).marginAll(10),
                            Text(
                              'Food',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.shop, width: 40).marginAll(10),
                            Text(
                              'Shopping',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.mountain, width: 40).marginAll(10),
                            Text(
                              'Travelling',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.headset, width: 40).marginAll(10),
                            Text(
                              'Music',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.motorcycle, width: 40).marginAll(10),
                            Text(
                              'Automotive',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.fire, width: 40).marginAll(10),
                            Text(
                              'Popular',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.ball, width: 40).marginAll(10),
                            Text(
                              'Sport',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.muscle, width: 40).marginAll(10),
                            Text(
                              'Health',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.animal, width: 40).marginAll(10),
                            Text(
                              'animal',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppStyles.bottomShadow],
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const AppImage(asset: Assets.art, width: 40).marginAll(10),
                            Text(
                              'Art',
                              style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold, colorText: AppColors.grayMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ROOT_PAGE);
                  },
                  style: ButtonStyle(textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18(fontWeight: FontWeight.bold))),
                  child: const Text("Continue"),
                ),
              ).marginOnly(top: 5),
            ],
          ),
        ),
      ),
    ));
  }
}
