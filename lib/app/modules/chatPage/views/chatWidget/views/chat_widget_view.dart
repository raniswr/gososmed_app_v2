import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';
import '../controllers/chat_widget_controller.dart';

class ChatWidgetView extends GetView<ChatWidgetController> {
  const ChatWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.bgcolor,
          title: Row(
            children: [
              const AppImage(asset: Assets.grub, width: 50),
              Text(
                'Yamanakan clan grub',
                style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
              ).marginOnly(left: 10)
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) {
                  if (index.isEven) {
                    return Column(
                      children: const [
                        BubbleSpecialThree(
                          text: 'Please try and give some feedback on it!',
                          color: AppColors.lightPink,
                          tail: true,
                          textStyle: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    );
                  } else {
                    //Bubble
                    return const BubbleSpecialThree(
                      text: "Thanks",
                      color: Color(0xFFE8E8EE),
                      tail: true,
                      isSender: false,
                    );
                  }
                }),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: AppStyles.inputDecorationFloating(
                    "",
                    "messege",
                    disableLabel: true,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.mic,
                        size: 25,
                        color: AppColors.grayMedium,
                      ),
                    ),
                  ),
                ).marginOnly(top: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
