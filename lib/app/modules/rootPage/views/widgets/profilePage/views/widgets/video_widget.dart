import 'package:flutter/material.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/profilePage/controllers/profile_page_controller.dart';
import 'package:get/get.dart';

class VideoWidget extends GetView<ProfilePageController> {
  const VideoWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220, childAspectRatio: 3 / 2, mainAxisExtent: 250, mainAxisSpacing: 5),
                  itemCount: 8,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 500,
                      decoration: BoxDecoration(color: AppColors.white, border: Border.all(color: AppColors.white)),
                      child: controller.videoPlayerController?.value.isInitialized == true
                          ? AspectRatio(
                              aspectRatio: controller.videoPlayerController?.value.aspectRatio ?? 10 / 10,
                              child: VideoPlayer(controller.videoPlayerController!),
                            )
                          : Container(),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
