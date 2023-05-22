import 'package:get/get.dart';

import '../controllers/chat_widget_controller.dart';

class ChatWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWidgetController>(
      () => ChatWidgetController(),
    );
  }
}
