import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/controllers/transaction_controller.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/bill.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/filter.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/transaction_item.dart';

class TransactionsPage extends StatelessWidget {
  TransactionsPage({super.key});
  final TextStyle activeStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color(0xFF313131),
  );

  final TextStyle inactiveStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(0, 0, 0, 0.25),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/welcome_bg_img.png"), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: const Text(
                  'Transactions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                centerTitle: true,
                // green with opacity of 0.5
                backgroundColor:
                    const Color(0xFF00DBB7), // green with opacity of 0.5
                elevation: 0,

                //menu hamburger with notification button at the right and title centered
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.89,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Filter(),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
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
                                        secondaryReason:
                                            'conception de meuble'),
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
                                        secondaryReason:
                                            'conception de meuble'),
                                    TransactionItem(
                                        id: 14578,
                                        amount: 35450,
                                        date: '07 novembre',
                                        toFname: 'MEHOU',
                                        toLname: 'David Antoine',
                                        principalReason: 'Menuiserie',
                                        secondaryReason:
                                            'conception de meuble'),
                                  ],
                                ),
                              ),
                            ),
                            if (Get.find<TransactionController>()
                                    .isItemselected
                                    .value ==
                                true)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
