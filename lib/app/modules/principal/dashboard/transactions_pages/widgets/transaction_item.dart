import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionItem extends StatelessWidget {
  final int? id;
  final double? amount;
  final String? date;
  final String? toFname;
  final String? toLname;
  final String? principalReason;
  final String? secondaryReason;
  const TransactionItem(
      {super.key,
      required this.id,
      required this.amount,
      required this.date,
      required this.toFname,
      required this.toLname,
      required this.principalReason,
      required this.secondaryReason});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<TransactionController>().isItemselected.value = true;
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.019999999552965164),
          border: Border(
            left: BorderSide(
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            top: BorderSide(
              width: 0.30,
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            right: BorderSide(
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            bottom: BorderSide(
              width: 0.30,
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 97.15,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 34.15,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ID',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.42,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 3.10),
                              Text(
                                '${id!}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF00DAB7),
                                  fontSize: 12.42,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 3.10),
                        SizedBox(
                          height: 34.05,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${amount!}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 3.10),
                                  const Text(
                                    'FCFA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.38,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3.10),
                              Text(
                                date!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.38,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 3.10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'à',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.45,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  toFname!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF00DAB7),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3.10),
                            Text(
                              toLname!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF00DAB7),
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Motif :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            secondaryReason!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11.38,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          principalReason!,
                          style: const TextStyle(
                            color: Color(0xFF00DAB7),
                            fontSize: 11.38,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Télécharger le reçu',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF00DAB7),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
