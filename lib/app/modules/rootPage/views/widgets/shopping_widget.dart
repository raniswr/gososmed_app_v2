import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/core/constant/assets.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:gososmed_app/core/constant/styles.dart';
import 'package:gososmed_app/core/widgets/lancer_image.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                'Product',
                style: AppStyles.styleTextBody25(),
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                const Icon(
                  Icons.shopping_cart,
                  color: AppColors.yellow,
                ).marginOnly(
                  right: 20,
                )
              ],
            ).marginOnly(top: 20)),
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
                length: 2,
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Column(
                    children: [
                      TabBar(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                        indicatorColor: AppColors.yellow,
                        labelColor: AppColors.yellow,
                        labelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                        unselectedLabelColor: AppColors.grayMedium,
                        unselectedLabelStyle: AppStyles.styleTextBody18(colorText: AppColors.grayMedium, fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            child: Text('Best Sale'),
                          ),
                          Tab(
                            child: Text('Product'),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[BestSaleItem()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BestSaleItem extends StatelessWidget {
  const BestSaleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, childAspectRatio: 6 / 2, mainAxisExtent: 260, mainAxisSpacing: 20, crossAxisSpacing: 20),
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT_PAGE);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 200,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            const AppImage(
                              asset: Assets.product,
                              width: 180,
                            ).marginSymmetric(vertical: 15),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Moon Earing',
                                    style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                                  ).paddingSymmetric(horizontal: 30),
                                  Text('120k', style: AppStyles.styleTextBody14(colorText: AppColors.yellow, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
