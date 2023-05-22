import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/modules/rootPage/controllers/root_page_controller.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';
import 'package:video_player/video_player.dart';

class HomeWidget extends GetView<RootPageController> {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.darkBlack,
        body: GetBuilder<RootPageController>(builder: (controller) {
          return PageView.builder(
            itemCount: controller.allPost?.data?.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var dataPost = controller.allPost?.data?[index];
              return Builder(builder: (context) {
                return Stack(
                  children: [
                    Positioned(
                      child: InkWell(
                        onTap: () {
                          controller.onTappedVideo();
                        },
                        child: SizedBox(
                          height: double.infinity,
                          child: controller.videoPlayerController?.value.isInitialized == true
                              ? SizedBox(
                                  width: double.infinity,
                                  child: AspectRatio(
                                    aspectRatio: controller.videoPlayerController?.value.aspectRatio ?? 8 / 10,
                                    child: VideoPlayer(controller.videoPlayerController!),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 410,
                      right: 195,
                      child: Icon(
                        controller.videoPlayerController?.value.isPlaying == true ? Icons.pause : Icons.play_arrow,
                        size: 60,
                        color: AppColors.grayTrans.withOpacity(0.7),
                      ),
                    ),
                    const Positioned(
                      bottom: 300,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),
                    const Positioned(
                      bottom: 230,
                      right: 10,
                      child: Icon(
                        Icons.comment_rounded,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),
                    const Positioned(
                      bottom: 170,
                      right: 10,
                      child: Icon(
                        Icons.share,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          width: 500,
                          color: AppColors.white.withOpacity(0.6),
                          child: Row(
                            children: [
                              Expanded(
                                  child: const AppImage(
                                asset: Assets.profile,
                                width: 100,
                                height: 90,
                              ).marginOnly(left: 40)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PROFILE_PAGE);
                                      },
                                      child: Text(
                                        'Rose Blackpink',
                                        style: AppStyles.styleTextBody25(colorText: AppColors.white, fontWeight: FontWeight.bold),
                                      ).paddingOnly(top: 20)),
                                  Text(
                                    // dataPost?.attributes?.captions ?? "",
                                    'make your day beautiful',
                                    style: AppStyles.styleTextBody18(colorText: AppColors.white),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 10),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColors.pink),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite,
                                          color: AppColors.white,
                                        ).marginOnly(left: 5),
                                        Text(
                                          '7.7k',
                                          style: AppStyles.styleTextBody14(colorText: AppColors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).paddingSymmetric(horizontal: 30),
                              ),
                            ],
                          ),
                        )),
                  ],
                );
              });
            },
          );
        }),
      );
    });
  }
}
