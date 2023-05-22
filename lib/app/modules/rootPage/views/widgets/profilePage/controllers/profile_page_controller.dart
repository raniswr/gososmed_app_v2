import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ProfilePageController extends GetxController {
  VideoPlayerController? videoPlayerController;

  @override
  void onReady() async {
    try {
      log("[video] init video player");
      videoPlayerController = VideoPlayerController.asset('assets/videos/rose.mp4')
        ..initialize().then((_) {
          videoPlayerController?.setLooping(true);
          videoPlayerController?.play();
          update();
        });
    } catch (e) {
      log("error initialize video player");
    }
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
    try {
      videoPlayerController?.dispose();
      videoPlayerController = null;
    } catch (e) {
      log("[video] error disposing video player");
    }
  }
}
