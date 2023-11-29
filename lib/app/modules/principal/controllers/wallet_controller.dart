import 'package:get/get.dart';

class WalletController extends GetxController {
  RxBool hideBalance = false.obs;
  RxDouble balance = 0.0.obs;
  RxDouble nextPayment = 25450.0.obs;
  RxString nextPaymentDate = '1er Janvier 2024'.obs;
  RxDouble debt = 0.0.obs;
}
