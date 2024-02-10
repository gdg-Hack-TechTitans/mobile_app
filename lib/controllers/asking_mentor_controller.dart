

import 'package:get/get.dart';

class AskingMentorController extends GetxController{
  final List<String> mentorRoles = ['UI/UX', 'Web Dev', 'Mobile Dev', 'AI'];
  RxList<String> selectedRoles = <String>[].obs;

  void toggleRole(String role) {
    if (selectedRoles.contains(role)) {
      selectedRoles.remove(role);
    } else {
      selectedRoles.add(role);
    }
  }

  void submit() {
    // Add your submission logic here
    print('Selected Roles: $selectedRoles');
    // Reset selected roles after submission
    selectedRoles.clear();
  }
}