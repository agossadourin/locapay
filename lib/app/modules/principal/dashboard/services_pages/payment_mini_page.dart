import 'package:flutter/material.dart';

import 'package:locapay/app/modules/principal/payments/widgets/payment.dart';

class PaymentMiniPage extends StatefulWidget {
  const PaymentMiniPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMiniPageState createState() => _PaymentMiniPageState();
}

class _PaymentMiniPageState extends State<PaymentMiniPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Payment(
      phonecontroller: phoneController,
      amountcontroller: amountController,
    );
  }
}
