import 'package:get/get.dart';


class NotificationController extends GetxController {
  RxInt notificationCount = 7.obs;
  void incrementNotificationCount() {
    notificationCount.value++;
  }
  void decrementNotificationCount() {
    notificationCount.value--;
  }
}