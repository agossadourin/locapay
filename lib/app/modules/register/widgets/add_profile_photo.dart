import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/file_controller.dart';

class AddProfilePhoto extends StatefulWidget {
  const AddProfilePhoto({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddProfilePhotoState createState() => _AddProfilePhotoState();
}

class _AddProfilePhotoState extends State<AddProfilePhoto> {
  //File? _imageFile;
  //declare File using Getx

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final tempDir = await getTemporaryDirectory();
      final tempFileName =
          'temp_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final tempFile = File('${tempDir.path}/$tempFileName');

      await pickedFile.readAsBytes().then((data) {
        return tempFile.writeAsBytes(data);
      });

      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('image', base64Image);
      Get.find<FileController>().file.value = tempFile;
      Get.find<FileController>().tempFilePath.value = tempFile.path;
      Get.find<FileController>().isUploaded.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_album),
                  title: const Text('Galerie'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Obx(
            () => Get.find<FileController>().file.value != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      Get.find<FileController>().file.value!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
          )),
    );
  }
}
