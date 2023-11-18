import 'package:get/get.dart';

class WalletController extends GetxController {
  RxBool hideBalance = false.obs;
  RxDouble balance = 0.0.obs;
  RxDouble nextPayment = 25450.0.obs;
  RxString nextPaymentDate = '1er Décembre 2023'.obs;
}
