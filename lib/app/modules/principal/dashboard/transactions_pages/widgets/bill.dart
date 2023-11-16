import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/action_button.dart';
import '../../../../../widgets/action_button_2.dart';
import '../controllers/transaction_controller.dart';

class Bill extends StatelessWidget {
  final String? title;
  final String? receiver;
  final String? date;
  final String? reason;
  final String? paidAmount;
  final String? remainsToPay;
  final double? penalty;
  const Bill({
    super.key,
    required this.title,
    required this.receiver,
    required this.date,
    required this.reason,
    required this.paidAmount,
    required this.remainsToPay,
    required this.penalty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: penalty! > 0
                ? const Color(0xFFFF0202)
                : const Color(0xFF00DAB7),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 15,
            offset: Offset(3, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        'Facture N°${title!}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: penalty! > 0
                              ? const Color(0xFFFF0202)
                              : const Color(0xFF00DAB7),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.30,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 267,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 267,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 267,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 77,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 21,
                                                height: 21,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 21,
                                                        height: 21,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/receiver.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 21,
                                                height: 21,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 21,
                                                        height: 21,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/calendar.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bénéficiaire',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Payé le',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 107,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      receiver!,
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    date!,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontSize: 12,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 74,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/info_black.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/coins.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Motif',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Montant payé',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 107,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      reason!,
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 107,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${paidAmount!} FCFA',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 76,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/pie.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/faq_black.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Reste à payer',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Pénalités',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${remainsToPay!} FCFA',
                                                    style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontSize: 12,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 107,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      ' + ${penalty!} %',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.30,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Total payé : ${paidAmount!} FCFA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: penalty! > 0
                        ? const Color(0xFFFF0202)
                        : const Color(0xFF00DAB7),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.30,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/bill_certification.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: ActionButton(
                  onPressed: () {
                    Get.find<TransactionController>().isItemselected.value =
                        false;
                  },
                  action: 'Retour',
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.47,
                child: ActionButton2(
                  onPressed: () {},
                  icon: 'assets/icons/download_bill.png',
                  action: 'Télécharger',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
