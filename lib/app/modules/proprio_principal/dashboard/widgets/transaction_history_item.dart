import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  //transaction type: 0: sent, 1: deposit, 2: withdraw
  final int? transactionType;
  final String? transactionDate;
  final double? transactionAmount;
  final String? transactionReason;
  final String? fromOrTo;
  const TransactionHistoryItem(
      {super.key,
      required this.transactionType,
      required this.transactionDate,
      required this.transactionAmount,
      required this.transactionReason,
      required this.fromOrTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 53,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6.66),
                decoration: ShapeDecoration(
                  color: const Color(0x2600DAB7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66.61),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 13.32,
                      height: 13.32,
                      child: Stack(
                        children: [
                          Container(
                            width: 13.32,
                            height: 13.32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(transactionType == 1
                                    ? "assets/icons/history_received.png"
                                    : "assets/icons/history_sent.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionType! == 0
                        ? 'Transfert'
                        : transactionType! == 1
                            ? 'Dépôt'
                            : 'Retrait',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'À : $fromOrTo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    transactionDate!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$transactionAmount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF00DAB7),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    transactionReason!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
