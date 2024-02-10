import 'package:event_manager/controllers/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lost_details.dart';

class LostThings extends StatelessWidget {
  LostThings({super.key});

  final BottomSheetController controller =
      Get.put<BottomSheetController>(BottomSheetController());

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
                    "Lost Things",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, _) => const Divider(
                    color: Colors.grey,
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => LostThingDetails());
                      },
                      child: Container(
                        height: 148,
                        // color: Colors.lightGreenAccent,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name of the thing",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 16, 24, 0),
                                        child: Text(
                                          "Description of the thing that is lost",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // color: Colors.pink,
                                  ),
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUa4I4-M_eGC2ceJZ3DKou5o80WWUxGusQLw&usqp=CAU"),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("4h ago - 21 min read"),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark_border,
                                    )),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_horiz,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => controller.pickImage(),
                      child: Obx(() => controller.imagePath.value.isEmpty
                          ? Icon(Icons.add_a_photo)
                          : Image.asset(
                              controller.imagePath.value,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )),
                    ),
                    TextFormField(
                      controller: controller.itemNameController,
                      decoration: InputDecoration(labelText: 'Item Name'),
                    ),
                    TextFormField(
                      controller: controller.contactController,
                      decoration: InputDecoration(labelText: 'Contact'),
                    ),
                    TextFormField(
                      controller: controller.messageController,
                      decoration:
                          InputDecoration(labelText: 'Message (Optional)'),
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
          child: const Icon(Icons.add),
        ));
  }
}
