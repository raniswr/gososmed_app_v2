import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/data/models/model_post.dart';
import 'package:gososmed_app/app/data/providers/open_api_providers.dart';
import 'package:gososmed_app/app/modules/chatPage/views/chat_page_view.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/home_widget.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/profilePage/views/profile_page_view.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/shopping_widget.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/upload_widget.dart';
import 'package:video_player/video_player.dart';

class RootPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  ModelPost? allPost;
  //Bottom NavigationBar
  int selectedIndex = 0;
  List<Widget> pages = const [
    HomeWidget(),
    ChatPageView(),
    UploadWidget(),
    ShopWidget(),
  ];

  onItemTapped(int value) {
    selectedIndex = value;
    update();
  }

//Video Player
  VideoPlayerController? videoPlayerController;

  // @override
  // void onInit() async {

  //   super.onInit();
  // }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  onTappedVideo() {
    videoPlayerController?.value.isPlaying == true ? videoPlayerController?.pause() : videoPlayerController?.play();
    update();
  }

  @override
  void onReady() async {
    ModelPost? result = await OpenAPIProviders.getAllPost();

    if (result != null) {
      allPost = result;
      update();
    }
    videoPlayerController = VideoPlayerController.asset('assets/videos/rose1.mp4')
      ..initialize().then((_) {
        videoPlayerController?.setLooping(true);
        videoPlayerController?.play();
      });
    update();

    super.onReady();
  }

  bool isShow = false;
  visibilityShow() {
    if (isShow == true) {
      isShow = false;
      update();
    } else {
      isShow = true;
      update();
    }
  }
}
