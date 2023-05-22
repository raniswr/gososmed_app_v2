import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: 'logo',
                child: const SizedBox(
                  width: 100,
                  child: AppImage(
                    asset: Assets.logoBlack,
                    width: 80,
                  ),
                ).marginOnly(top: 90),
              ),
              Text(
                'Via social media',
                style: AppStyles.styleTextBody16(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [AppStyles.bottomShadow],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const AppImage(
                      asset: Assets.google,
                    ),
                  ),
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [AppStyles.bottomShadow],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const AppImage(
                      asset: Assets.twitter,
                    ),
                  ).marginSymmetric(horizontal: 20),
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [AppStyles.bottomShadow],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AppImage(
                      asset: Assets.facebook,
                    ),
                  )
                ],
              ).marginSymmetric(vertical: 20),
              SizedBox(
                width: double.infinity,
                height: 550,
                child: GetBuilder<LoginPageController>(builder: (controller) {
                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Material(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(100),
                          child: TabBar(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50), // Creates border
                                color: AppColors.white),
                            indicatorColor: AppColors.textBlack,
                            labelColor: AppColors.textBlack,
                            labelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                            unselectedLabelColor: AppColors.grayMedium,
                            unselectedLabelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(
                                child: Text('Login'),
                              ),
                              Tab(
                                child: Text('Register'),
                              ),
                            ],
                          ),
                        ).marginOnly(bottom: 20),
                        Expanded(
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            children: <Widget>[
                              Form(
                                  key: controller.formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: controller.usernameLogin,
                                        decoration: AppStyles.inputDecorationFloating("", "Enter your email",
                                            suffixIcon: const Icon(
                                              Icons.warning_amber_rounded,
                                              color: AppColors.pink,
                                            )),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        controller: controller.passwordLogin,
                                        decoration: AppStyles.inputDecorationFloating("", "Enter your password",
                                            suffixIcon: const Icon(
                                              Icons.check_rounded,
                                              color: AppColors.green,
                                            )),
                                      ).marginOnly(top: 10),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 90,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.login(context);
                                          },
                                          style: ButtonStyle(textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18(fontWeight: FontWeight.bold))),
                                          child: const Text("LOGIN"),
                                        ).marginOnly(top: 20),
                                      ),
                                    ],
                                  )),
                              Form(
                                key: controller.formKeyRegist,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                      },
                                      controller: controller.usernameRegister,
                                      decoration: AppStyles.inputDecorationFloating("", "Enter your username",
                                          suffixIcon: const Icon(
                                            Icons.warning_amber_rounded,
                                            color: AppColors.pink,
                                          )),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }

                                        return null;
                                      },
                                      controller: controller.emailRegister,
                                      decoration: AppStyles.inputDecorationFloating("", "Enter your email",
                                          suffixIcon: const Icon(
                                            Icons.check_rounded,
                                            color: AppColors.green,
                                          )),
                                    ).marginOnly(top: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        controller.checkPassword(value);
                                      },
                                      controller: controller.passwordRegister,
                                      obscureText: true,
                                      decoration: AppStyles.inputDecorationFloating(
                                        "",
                                        "Enter your password",
                                        suffixIcon:
                                            controller.isPasswordCorrect ? const Icon(Icons.check_rounded, color: AppColors.green) : const Icon(Icons.warning_amber_rounded, color: AppColors.red),
                                      ),
                                    ).marginOnly(top: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: controller.passwordRegister,
                                      obscureText: true,
                                      decoration: AppStyles.inputDecorationFloating("", "Repeat password",
                                          suffixIcon: const Icon(
                                            Icons.check_rounded,
                                            color: AppColors.green,
                                          )),
                                    ).marginOnly(top: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.register(context);
                                        },
                                        style: ButtonStyle(textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18(fontWeight: FontWeight.bold))),
                                        child: const Text("REGISTER"),
                                      ).marginOnly(top: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          )),
    );
  }
}
