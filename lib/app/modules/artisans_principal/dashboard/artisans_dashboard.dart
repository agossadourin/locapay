import 'package:flutter/material.dart';
import 'package:locapay/app/modules/artisans_principal/dashboard/widgets/artisans_wallet_widget.dart';
import 'package:locapay/app/modules/proprio_principal/dashboard/widgets/transaction_history_item.dart';
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
                const TransactionHistoryItem(
                  transactionType: 0,
                  transactionReason: 'Prestation',
                  transactionAmount: 50000,
                  transactionDate: '10h00',
                  fromOrTo: 'Jacqus Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 1,
                  transactionReason: 'Prestation',
                  transactionAmount: 13000,
                  transactionDate: '11h29',
                  fromOrTo: 'Abraham Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    '31 Oct. 2023',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
                ),
                const TransactionHistoryItem(
                  transactionType: 2,
                  transactionReason: 'Prestation',
                  transactionAmount: 89000,
                  transactionDate: '8h00',
                  fromOrTo: 'Julian Doe',
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
