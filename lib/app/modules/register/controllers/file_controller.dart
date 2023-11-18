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
}
