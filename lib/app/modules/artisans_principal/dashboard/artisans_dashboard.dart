import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/artisans_principal/dashboard/widgets/artisans_wallet_widget.dart';
import 'package:locapay/app/modules/proprio_principal/dashboard/widgets/transaction_history_item.dart';
import 'package:locapay/app/modules/register/controllers/transactions_controller.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';

class ArtisansDashBoard extends StatelessWidget {
  const ArtisansDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ArtisansWalletWidget(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFF00DAB7),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.51,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    '1 nov. 2023',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (Get.find<TransactionsController>().transactions.isNotEmpty)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      itemCount: Get.find<TransactionsController>()
                          .transactions
                          .length,
                      itemBuilder: (context, index) {
                        final transaction = Get.find<TransactionsController>()
                            .transactions[index];
                        return TransactionHistoryItem(
                          transactionType: transaction.type == "Recharge"
                              ? 1
                              : 0, // Update this according to your transaction model
                          transactionReason: transaction.type,
                          transactionAmount: double.parse(transaction.amount),
                          transactionDate: transaction
                              .createdAt, // You might need to format this
                          fromOrTo: transaction
                              .userId, // Update this according to your transaction model
                        );
                      },
                    ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF00DAB7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RectActionButton(
                    action: 'Télécharger l\'historique complet',
                    onPressed: () {},
                    icon: "assets/icons/history.png")
              ],
            ),
          ),
        )
      ],
    );
  }
}
