import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import '../controllers/root_page_controller.dart';

class RootPageView extends GetView<RootPageController> {
  const RootPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return MaterialApp(
        home: Scaffold(
          body: controller.pages.elementAt(controller.selectedIndex),
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ),
      );
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: AppColors.white,
          iconSize: 35,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_rounded,
                color: AppColors.grayMedium,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.home_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: AppColors.grayMedium,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.add_box_outlined,
                color: AppColors.grayMedium,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.shopping_bag,
                color: AppColors.grayMedium,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.shopping_bag,
                    color: AppColors.white,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
                color: AppColors.grayMedium,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                  ),
                ),
              ),
              label: '',
            ),
          ],
          currentIndex: controller.selectedIndex,
          unselectedItemColor: AppColors.grayMedium,
          selectedItemColor: AppColors.darkGreen,
          elevation: 0,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}
