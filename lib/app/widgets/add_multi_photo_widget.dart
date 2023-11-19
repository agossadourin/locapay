import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:path_provider/path_provider.dart';

class AddMultiPhotoWidget extends StatefulWidget {
  const AddMultiPhotoWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddMultiPhotoWidgetState createState() => _AddMultiPhotoWidgetState();
}

class _AddMultiPhotoWidgetState extends State<AddMultiPhotoWidget> {
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

      Get.find<FileController>().rentFiles.add(Rx<File?>(tempFile));
      print("*************************************************\n \n \n");
      print(Get.find<FileController>().rentFiles.length);
      Get.find<FileController>().renttempFilePaths.add(RxString(tempFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.find<FileController>().biometricIsUploaded.value == false
              ? Colors.grey[400]
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (Get.find<FileController>().rentFiles.isNotEmpty)
                  Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set a specific width constraint
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Get.find<FileController>().rentFiles.length,
                        itemBuilder: (context, index) {
                          return index !=
                                  Get.find<FileController>().rentFiles.length -
                                      1
                              ? Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          Get.find<FileController>()
                                              .rentFiles[index]
                                              .value!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.find<FileController>()
                                              .rentFiles
                                              .removeAt(index);
                                          Get.find<FileController>()
                                              .renttempFilePaths
                                              .removeAt(index);
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
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
                              : Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              Get.find<FileController>()
                                                  .rentFiles[index]
                                                  .value!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.find<FileController>()
                                                  .rentFiles
                                                  .removeAt(index);
                                              Get.find<FileController>()
                                                  .renttempFilePaths
                                                  .removeAt(index);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
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
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Wrap(
                                              children: <Widget>[
                                                ListTile(
                                                  leading: const Icon(
                                                      Icons.camera_alt),
                                                  title: const Text('Camera'),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    _pickImage(
                                                        ImageSource.camera);
                                                  },
                                                ),
                                                ListTile(
                                                  leading: const Icon(
                                                      Icons.photo_album),
                                                  title: const Text('Galerie'),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    _pickImage(
                                                        ImageSource.gallery);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                        }),
                  ),
                const SizedBox(
                  width: 10,
                ),
                if (Get.find<FileController>().rentFiles.isEmpty)
                  GestureDetector(
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
