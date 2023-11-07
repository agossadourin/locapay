import 'dart:io';
import 'package:get/get.dart';

class FileController extends GetxController {
  var file = Rx<File?>(null);
  final RxString tempFilePath = ''.obs;
}
