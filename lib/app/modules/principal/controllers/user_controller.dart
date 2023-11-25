import 'package:get/get.dart';

import '../../../data/models/user.dart';

class UserController extends GetxController {
  // Add your controller logic here
  var userData = Rx<User?>(null);
  RxInt accountType = 0.obs; // 0 = locataire, 1 = proprietaire, 2 = artisan
  RxBool isVerified = false.obs;
}
