import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';

import '../deposit/deposit_page.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF00DAB7),
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
                bottom: BorderSide(width: 0.50, color: Colors.white),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/wallet.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    Get.find<WalletController>()
                                        .balance!
                                        .value
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                const Text(
                                  'FCFA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 310,
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.only(left: 24),
            decoration: const BoxDecoration(color: Color(0xFF00CAAA)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => DepositPage());
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    width: 0.50, color: Colors.white),
                                top: BorderSide(color: Colors.white),
                                right: BorderSide(color: Colors.white),
                                bottom: BorderSide(color: Colors.white),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/icons/add.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Recharger',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              left:
                                  BorderSide(width: 0.50, color: Colors.white),
                              top: BorderSide(color: Colors.white),
                              right: BorderSide(color: Colors.white),
                              bottom: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/transactions.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Paiements et Transaction',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
