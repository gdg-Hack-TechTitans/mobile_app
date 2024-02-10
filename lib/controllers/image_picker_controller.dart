import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetController extends GetxController {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  RxString imagePath = ''.obs;

  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
    }
  }

  void submit() {
    final itemName = itemNameController.text;
    final contact = contactController.text;
    final message = messageController.text;

    // Add your submission logic here
    // For demonstration purposes, printing the entered data
    print('Item Name: $itemName');
    print('Contact: $contact');
    print('Message: $message');
    print('Image Path: ${imagePath.value}');
  }
}