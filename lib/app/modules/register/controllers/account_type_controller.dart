import 'package:get/get.dart';

class AccountTypeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isAccountTypeChosen = false.obs;
  RxInt quitAppVal = 0.obs;
  RxBool hidePassword = true.obs;
  RxBool hidePassword2 = true.obs;
}
