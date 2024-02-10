import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class MentorsNotification extends StatelessWidget {
  MentorsNotification({super.key});

  NotificationController controller = Get.put(NotificationController());

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
                  "Mentors Notifications",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Obx(
              () => (controller.notificationCount == 0)
                  ? Padding(
                       padding:  EdgeInsets.only(top: 300),
                      child: Text("No Notifications"),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controller.notificationCount.value,
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              title: Text(
                                "Team Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                "by: Participant Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  controller.notificationCount.value--;
                                },
                                child: Text("Accept"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
