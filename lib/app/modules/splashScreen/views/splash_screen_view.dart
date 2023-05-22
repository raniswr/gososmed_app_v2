import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';
import 'package:gososmed_app/utils/const.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: GetBuilder<SplashScreenController>(builder: (controller) {
          return SizedBox(
            width: 440,
            child: Row(
              children: [
                const Expanded(
                    child: Hero(
                  tag: 'logo',
                  child: AppImage(asset: Assets.logoBlack),
                )),
                Expanded(
                  child: SizedBox(
                    width: 150.0,
                    child: TextLiquidFill(
                      text: 'GOSOSMED',
                      waveColor: AppColors.lightPink,
                      boxBackgroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 140.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
