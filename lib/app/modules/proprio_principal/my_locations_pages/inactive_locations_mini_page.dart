import 'package:flutter/material.dart';

import 'package:locapay/app/modules/principal/payments/widgets/payment.dart';

class InactiveLocationsMiniPage extends StatefulWidget {
  const InactiveLocationsMiniPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InactiveLocationsMiniPageState createState() =>
      _InactiveLocationsMiniPageState();
}

class _InactiveLocationsMiniPageState extends State<InactiveLocationsMiniPage> {
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
