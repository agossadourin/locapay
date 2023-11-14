import 'package:flutter/material.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/bill.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/widgets/payment_item.dart';
import 'package:locapay/app/modules/principal/payments/widgets/payment.dart';

import '../../../../widgets/action_button_2.dart';

class PaymentMiniPage extends StatelessWidget {
  const PaymentMiniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Payment();
  }
}
