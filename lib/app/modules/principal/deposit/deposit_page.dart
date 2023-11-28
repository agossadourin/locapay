import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/models/transaction_model.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/modules/proprio_principal/controllers/proprio_principal_controller.dart';
import 'package:locapay/app/modules/proprio_principal/proprio_principal.dart';
import 'package:locapay/app/modules/register/controllers/account_type_controller.dart';
import 'package:locapay/app/modules/register/controllers/transactions_controller.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

import '../../../widgets/action_button.dart';

// ignore: must_be_immutable
class DepositPage extends StatelessWidget {
  final bool? isDeposit;
  DepositPage({super.key, required this.isDeposit});

  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();
  AuthService authService = AuthService();

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
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    isDeposit! ? 'Recharger mon compte' : 'Faire un retrait',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                          image: AssetImage('assets/icons/Notifications.png')),
                    )
                  ],
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
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                isDeposit!
                                    ? 'Numéro de dépot'
                                    : 'Numéro  du compte a créditer',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            MyFormField(
                                controller: phonecontroller,
                                testInputType: TextInputType.number,
                                hintText: 'Entrez le numéro',
                                leftIcon: "assets/icons/smartphone.png",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Entrez votre numéro';
                                  }
                                  return null;
                                },
                                width: MediaQuery.of(context).size.width * 0.7,
                                hasSepBar: false),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const Text(
                                'Le numéro de dépôt est celui à partir duquel vous comptez faire le dépôt sur votre compte par momo.',
                                style: TextStyle(
                                  color: Color(0xFF00DAB7),
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const Text(
                                'Montant',
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            MyFormField(
                                controller: amountcontroller,
                                testInputType: TextInputType.number,
                                hintText: 'Entrez le montant',
                                leftIcon: "assets/icons/dollar.png",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Entrez le montant';
                                  }
                                  return null;
                                },
                                width: MediaQuery.of(context).size.width * 0.7,
                                hasSepBar: false),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ActionButton(
                                  action: isDeposit!
                                      ? "Faire le dépôt"
                                      : 'Faire le retrait',
                                  onPressed: () {
                                    Get.defaultDialog(
                                      radius: 10,
                                      titlePadding: const EdgeInsets.all(20),
                                      title:
                                          'Voulez-vous vraiment déposer ${amountcontroller.text} ?',
                                      titleStyle: const TextStyle(
                                        color: Color(0xFF00DAB7),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                      content: const Text(
                                        'Une fois le paiement lancé, le montant sera déduit de votre compte, Vous verrez alors la transaction s’ajouter à l’historique des paiements.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      textConfirm: 'Confirmer',
                                      textCancel: 'Annuler',
                                      confirm: GestureDetector(
                                        onTap: () async {
                                          Get.back();
                                          if (isDeposit!) {
                                            var answer =
                                                await authService.deposit(
                                                    amountcontroller.text,
                                                    'Recharge',
                                                    Get.find<UserController>()
                                                        .userData
                                                        .value!
                                                        .token
                                                        .split("|")[1]);

                                            if (answer is DioException) {
                                              // Handle the exception...
                                              print(
                                                  'Error message: ${answer.message}');
                                              print(
                                                  'Error data: ${answer.response?.data}');
                                              //show alert dialog
                                              Get.defaultDialog(
                                                title: 'Error',
                                                middleText: answer
                                                    .response!.data
                                                    .toString(),
                                                onConfirm: () => Get
                                                    .back(), // Navigate back when the confirm button is pressed
                                              );
                                            } else if (answer is Exception) {
                                              // Handle the exception...
                                              print(
                                                  'Error: ${answer.toString()}');
                                              //show alert dialog
                                              Get.defaultDialog(
                                                title: 'Error',
                                                middleText: answer.toString(),
                                                onConfirm: () => Get
                                                    .back(), // Navigate back when the confirm button is pressed
                                              );
                                            } else {
                                              Get.find<WalletController>()
                                                      .balance
                                                      .value =
                                                  answer["balance"].toDouble();

                                              TransactionModel transaction =
                                                  TransactionModel.fromJson(
                                                      answer);

                                              Get.find<TransactionsController>()
                                                  .transactions
                                                  .add(transaction);

                                              Get.defaultDialog(
                                                  title: 'Succès',
                                                  middleText:
                                                      " Vous avez éffectué avec succès un dépôt de ${amountcontroller.text} FCFA",
                                                  textConfirm: 'OK',
                                                  confirmTextColor:
                                                      const Color(0xFF00DAB7),
                                                  onConfirm: () {
                                                    Get.to(() => Get.find<
                                                                    AccountTypeController>()
                                                                .selectedIndex
                                                                .value ==
                                                            1
                                                        ? const Principal()
                                                        : const ProprioPrincipal());
                                                    print(Get.find<
                                                            ProprioPrincipalController>()
                                                        .hasLocation
                                                        .value);
                                                  });
                                            }
                                          }

                                          ////////////////////
                                          ///
                                          if (isDeposit! == false) {
                                            var answer =
                                                await authService.deposit(
                                                    amountcontroller.text,
                                                    'Retrait',
                                                    Get.find<UserController>()
                                                        .userData
                                                        .value!
                                                        .token
                                                        .split("|")[1]);

                                            if (answer is DioException) {
                                              // Handle the exception...
                                              print(
                                                  'Error message: ${answer.message}');
                                              print(
                                                  'Error data: ${answer.response?.data}');
                                              //show alert dialog
                                              Get.defaultDialog(
                                                title: 'Error',
                                                middleText: answer
                                                    .response!.data
                                                    .toString(),
                                                onConfirm: () => Get
                                                    .back(), // Navigate back when the confirm button is pressed
                                              );
                                            } else if (answer is Exception) {
                                              // Handle the exception...
                                              print(
                                                  'Error: ${answer.toString()}');
                                              //show alert dialog
                                              Get.defaultDialog(
                                                title: 'Error',
                                                middleText: answer.toString(),
                                                onConfirm: () => Get
                                                    .back(), // Navigate back when the confirm button is pressed
                                              );
                                            } else {
                                              TransactionModel transaction =
                                                  TransactionModel.fromJson(
                                                      answer);
                                              Get.find<TransactionsController>()
                                                  .transactions
                                                  .add(transaction);
                                              print(
                                                  "\n\n****************transactions*****************");
                                              print(Get.find<
                                                      TransactionsController>()
                                                  .transactions);
                                              Get.find<WalletController>()
                                                      .balance
                                                      .value =
                                                  answer["balance"].toDouble();

                                              Get.defaultDialog(
                                                  title: 'Succès',
                                                  middleText:
                                                      " Vous avez éffectué avec succès un retrait de ${amountcontroller.text} FCFA",
                                                  textConfirm: 'OK',
                                                  confirmTextColor:
                                                      const Color(0xFF00DAB7),
                                                  onConfirm: () {
                                                    Get.to(() => Get.find<
                                                                    AccountTypeController>()
                                                                .selectedIndex
                                                                .value ==
                                                            1
                                                        ? const Principal()
                                                        : const ProprioPrincipal());
                                                    print(Get.find<
                                                            ProprioPrincipalController>()
                                                        .hasLocation
                                                        .value);
                                                  });
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 103,
                                          height: 32,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF00DAB7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 22,
                                                height: 22,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 22,
                                                        height: 22,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/confirm.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Oui, payer',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      cancel: GestureDetector(
                                        onTap: () {
                                          //close dialog
                                          Get.back();
                                        },
                                        child: Container(
                                          width: 121,
                                          height: 35,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFFF0202),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/icons/cancel.png"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Non, annuler',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
