import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgwhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: Text(
            'All Activity',
            style: AppStyles.styleTextBody25(),
          ),
          backgroundColor: AppColors.bgwhite,
          centerTitle: true,
          elevation: 0,
        ).marginOnly(top: 20),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 580,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Material(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(170),
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
                      child: Text('Recently Activity'),
                    ),
                    Tab(
                      child: Text('Chat Messages'),
                    ),
                  ],
                ),
              ).marginOnly(bottom: 20),
              const Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[recentlyActivity()],
                ),
              ),
            ],
          ),
        ).paddingSymmetric(vertical: 30).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}

class recentlyActivity extends StatelessWidget {
  const recentlyActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Get.toNamed(Routes.CHAT_WIDGET);
        },
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xffDDDDDD),
                  //     blurRadius: 6.0,
                  //     // spreadRadius: 2.0,
                  //     // offset: Offset(0.0, 0.0),
                  //   )
                  // ],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 90,
                width: double.infinity,
                child: Row(
                  children: [
                    const AppImage(asset: Assets.grub, width: 60).marginSymmetric(horizontal: 25),
                    Column(
                      children: [
                        Expanded(
                          child: Text(
                            'Yamanaka clan grub',
                            style: AppStyles.styleTextBody18(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '8 new chat from member',
                            style: AppStyles.styleTextBody16(colorText: AppColors.grey),
                          ),
                        )
                      ],
                    ).marginSymmetric(vertical: 20),
                    Expanded(
                      child: Text(
                        '09:00 PM',
                        style: AppStyles.styleTextBody16(colorText: AppColors.grey),
                      ),
                    ).marginOnly(left: 40).marginOnly(bottom: 25),
                    const Icon(
                      Icons.circle_rounded,
                      color: AppColors.pink,
                      size: 10,
                    ).marginOnly(bottom: 25),
                  ],
                ),
              ).marginSymmetric(vertical: 5);
            }),
      ),
    );
  }
}
