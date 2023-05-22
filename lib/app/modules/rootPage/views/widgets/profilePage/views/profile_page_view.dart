import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/modules/rootPage/views/widgets/profilePage/views/widgets/video_widget.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              'Profile',
              style: AppStyles.styleTextBody25(),
            ),
            centerTitle: true,
            elevation: 0,
          ).marginOnly(top: 20),
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              width: 500,
              decoration: const BoxDecoration(color: AppColors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/rose.png'),
                    radius: 48,
                  ).marginOnly(left: 30).marginOnly(top: 3),
                  Container(
                          height: 120,
                          width: 300,
                          decoration: const BoxDecoration(color: AppColors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Rose Blackpink ',
                                    style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
                                  ),
                                  const AppImage(
                                    asset: Assets.verified,
                                    width: 20,
                                  ),
                                ],
                              ),
                              Container(
                                width: 300,
                                height: 80,
                                decoration: const BoxDecoration(color: AppColors.white),
                                child: Text(
                                  'Posts 70 | Follow 80k | Followers 3M  Make  your  day more  beautiful with your social media',
                                  style: AppStyles.styleTextBody16(colorText: AppColors.grayMedium),
                                  maxLines: 4,
                                ),
                              ),
                            ],
                          ).marginOnly(left: 20))
                      .marginAll(5)
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Column(
                    children: [
                      TabBar(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        indicatorColor: AppColors.pink,
                        labelColor: AppColors.pink,
                        labelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                        unselectedLabelColor: AppColors.grayMedium,
                        unselectedLabelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            child: Text('Video'),
                          ),
                          Tab(
                            child: Text('Liked'),
                          ),
                          Tab(
                            child: Text('Saved'),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            VideoWidget(),
                            VideoWidget(),
                            VideoWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).marginOnly(top: 5),
            )
          ],
        ));
  }
}
