import 'package:get/get.dart';

class PaymentTypeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt paymentType = 0.obs; // 0 = advance, 1 = rent, service = 2
}
