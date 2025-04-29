import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFile() async {
  final pickImage = ImagePicker();
  try {
    final xFile = await pickImage.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    throw e.toString();
  }
}
