import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/services_page.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/transactions_page.dart';
import 'package:locapay/app/modules/principal/dashboard/widgets/dashboard_widget.dart';
import 'package:locapay/app/modules/principal/payments/controllers/payment_type_controller.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashBoardWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.00,
          ),
          RectActionButton(
              action: 'Services',
              onPressed: () {
                Get.find<PaymentTypeController>().paymentType.value = 2;
                Get.to(() => ServicesPage());
              },
              icon: 'assets/icons/services.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          RectActionButton(
              action: 'Transactions',
              onPressed: () {
                Get.to(() => TransactionsPage());
              },
              icon: 'assets/icons/history.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          RectActionButton(
              action: 'Ecrire à l\'équipe',
              onPressed: () {},
              icon: 'assets/icons/email.png')
        ],
      ),
    );
  }
}
