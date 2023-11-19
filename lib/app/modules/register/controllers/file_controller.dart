import 'dart:io';
import 'package:get/get.dart';

class FileController extends GetxController {
  var file = Rx<File?>(null);
  final RxString tempFilePath = ''.obs;
  final RxBool isUploaded = false.obs;

  //biometric

  var biometricFile = Rx<File?>(null);
  final RxString biometricTempFilePath = ''.obs;
  final RxBool biometricIsUploaded = false.obs;

  //Rent photos
  // List<Rx<File?>> rentPhotos = List<Rx<File?>>.generate(
  //   5, // Specify the initial size of the list
  //   (index) => Rx<File?>(null), // Initialize each element with Rx<File?>(null)
  // );

  List<Rx<File?>> rentFiles = RxList<Rx<File?>>();

  List<RxString> renttempFilePaths = RxList<RxString>();

  // List<RxString> tempFilePaths = List<RxString>.generate(
  //   5, // Specify the initial size of the list
  //   (index) => ''.obs, // Initialize each element with an empty RxString
  // );
}
