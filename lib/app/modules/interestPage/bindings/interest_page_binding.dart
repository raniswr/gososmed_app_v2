import 'package:get/get.dart';

import '../controllers/interest_page_controller.dart';

class InterestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterestPageController>(
      () => InterestPageController(),
    );
  }
}
