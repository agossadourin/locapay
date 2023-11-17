import 'package:flutter/material.dart';
import 'package:locapay/app/modules/proprio_principal/dashboard/widgets/proprio_wallet_widget.dart';

class ProprioDashBoard extends StatelessWidget {
  const ProprioDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ProprioWalletWidget()],
    );
  }
}
