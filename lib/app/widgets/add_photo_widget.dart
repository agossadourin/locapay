import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:path_provider/path_provider.dart';

class AddPhotoWidget extends StatefulWidget {
  const AddPhotoWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPhotoWidgetState createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
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

      Get.find<FileController>().biometricFile.value = tempFile;
      Get.find<FileController>().biometricTempFilePath.value = tempFile.path;
      Get.find<FileController>().biometricIsUploaded.value = true;
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
        child: Obx(
          () => Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  Get.find<FileController>().biometricIsUploaded.value == false
                      ? Colors.grey[400]
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Get.find<FileController>().biometricFile.value != null
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          Get.find<FileController>().biometricFile.value!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            Get.find<FileController>().biometricFile.value =
                                null;
                            Get.find<FileController>()
                                .biometricTempFilePath
                                .value = '';
                            Get.find<FileController>()
                                .biometricIsUploaded
                                .value = false;
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
          ),
        ));
  }
}
