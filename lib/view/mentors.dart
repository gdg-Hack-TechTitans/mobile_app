import 'package:event_manager/controllers/asking_mentor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mentors extends StatelessWidget {
   Mentors({super.key});
  AskingMentorController controller = Get.put(AskingMentorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
    padding: const EdgeInsets.only(right: 16),
    child: Column(
    children: [
    Container(
    height: 42,
    child: Center(
    child: Text(
    "Mentors",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    Expanded(
    child: ListView.builder(
    itemCount: 7,
    itemBuilder: (context, index) {
    return Card(
    color: Colors.white,
    shadowColor: Colors.grey[700],
    child: ListTile(
    leading: CircleAvatar(
    backgroundColor: Colors.grey,
    radius: 24,
    child: Icon(
    Icons.person,
    color: Colors.white,
    ),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    title: Text(
    "Mentor Name",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    subtitle: Text(
    "Mentor Role",
    style: TextStyle(
    color: Colors.grey,
    ),
    ),
    trailing: Icon(
    Icons.circle,
    color: Colors.green,
    ),
    ),
    );
    },
    ),
    ),
    TextButton(
    onPressed: () {
    Get.bottomSheet(
    Container(
    padding: EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(
    'Select Mentor Roles:',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Obx(() =>
    Wrap(
    spacing: 10,
    children: controller.mentorRoles.map((role) {
    return FilterChip(
    label: Text(role),
    selected: controller.selectedRoles.contains(role),
    onSelected: (selected) {
    controller.toggleRole(role);
    },
    );
    }).toList(),
    ),
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {
    controller.submit();
    Get.back();
    },
    child: Text('Submit'),
    ),
    ],
    ),
    ),
    backgroundColor: Colors.white,
    );
    },
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    Icon(
    Icons.chat_bubble_outline,
    color: Colors.white,
    ),
    SizedBox(width: 8),
    Text(
    "Ask a mentor",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    ],
    ),
    style: TextButton.styleFrom(
    backgroundColor: Colors.purpleAccent.shade700,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    elevation: 3, // Add elevation for a raised effect
    ),
    ),

    ],
    ),
    ),
    );
  }
}






