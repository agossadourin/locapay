import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/controllers/transaction_controller.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/bill.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/filter.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/transaction_item.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Filter(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Obx(() => Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          TransactionItem(
                              id: 14578,
                              amount: 35450,
                              date: '07 novembre',
                              toFname: 'MEHOU',
                              toLname: 'David Antoine',
                              principalReason: 'Menuiserie',
                              secondaryReason: 'conception de meuble'),
                          TransactionItem(
                              id: 14578,
                              amount: 35450,
                              date: '07 novembre',
                              toFname: 'MEHOU',
                              toLname: 'Adjilan',
                              principalReason: 'Loyer',
                              secondaryReason: 'Mois de Novembre'),
                          TransactionItem(
                              id: 14578,
                              amount: 35450,
                              date: '07 novembre',
                              toFname: 'MEHOU',
                              toLname: 'David Antoine',
                              principalReason: 'Menuiserie',
                              secondaryReason: 'conception de meuble'),
                          TransactionItem(
                              id: 14578,
                              amount: 35450,
                              date: '07 novembre',
                              toFname: 'MEHOU',
                              toLname: 'David Antoine',
                              principalReason: 'Menuiserie',
                              secondaryReason: 'conception de meuble'),
                        ],
                      ),
                    ),
                  ),
                  if (Get.find<TransactionController>().isItemselected.value ==
                      true)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Bill(
                          title: '1245',
                          receiver: 'MEHOU David Antoine',
                          date: '07 Novembre',
                          reason: 'Loyer',
                          paidAmount: '25000.5',
                          remainsToPay: '2000',
                          penalty: 0),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
