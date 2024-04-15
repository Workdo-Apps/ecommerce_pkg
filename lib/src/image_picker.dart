// TODO Implement this library.

// ignore_for_file: avoid_print

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_pkg/widget/common_toast.dart';

class MyImagePicker {
  Future<File?> pickImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      print("====  ${pickedImage.path}");
      return File(pickedImage.path);
    } else {
      commonToast('Please pick image');
    }
  }
}
