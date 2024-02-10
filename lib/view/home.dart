import 'package:event_manager/controllers/hackathon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../main.dart';
import 'login.dart';


class Home extends StatelessWidget {
   Home({super.key});
  HackathonController controller = Get.put(HackathonController());

  @override
  Widget build(BuildContext context) {return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: const CircleAvatar(
                    child: Text("P"),
                    radius: 28,
                  ),
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: 350,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Full Name: Yasser korzane"), // Replace with actual user data
                              leading: Icon(Icons.person),
                            ),
                            ListTile(
                              title: Text("Number: 0672859965"), // Replace with actual user data
                              leading: Icon(Icons.phone),
                            ),
                            ListTile(
                              title: Text("Role: Mobile dev"), // Replace with actual user data
                              leading: Icon(Icons.work),
                            ),
                            ListTile(
                              title: Text("Team's Name: TechTitans"), // Replace with actual user data
                              leading: Icon(Icons.group),
                            ),
                            ListTile(
                              title: Text("Email: yasser.korzane@example.com"), // Replace with actual user data
                              leading: Icon(Icons.email),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 130),
                              title: const Text("Logout"),
                              leading: const Icon(Icons.logout),
                              onTap: () {
                                prefs!.clear();
                                Get.offAll(() => Login(),);
                              },
                            ),
                          ],
                        ),

                      ),

                    );
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome to Hack Manager!",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Participant Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: 80,
                child: Image.asset("assets/logo-lockup-gdg-horizontal_720-removebg-preview.png") ,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("See All"),
                  )
                ],
              ),
              SizedBox(
                height: 360,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.hackathons.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => NewsAppDetailPage(),
                      //     ),
                      //   );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "${controller.hackathons[index].thumbnail}"  ,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                             Text(
                              "${controller.hackathons[index].name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                             Text(
                              "${controller.hackathons[index].date.toString()}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    ],
  );
  }
}
