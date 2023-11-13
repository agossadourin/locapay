import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';
import 'package:locapay/app/modules/principal/deposit/deposit_page.dart';
import 'package:locapay/app/modules/principal/payments/controllers/payment_type_controller.dart';
import 'package:locapay/app/modules/principal/payments/widgets/payment_done.dart';
import 'package:locapay/app/modules/principal/payments/widgets/payment_type.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

import '../../../widgets/action_button.dart';
import '../../../widgets/rect_action_button.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();

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
                  title: const Text(
                    'Paiement du loyer',
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

                            /********************************************* */
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const Text(
                                'Mode de paiement:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.find<PaymentTypeController>()
                                              .selectedIndex
                                              .value = 0;
                                        },
                                        child: PaymentType(
                                          title: 'MOMO',
                                          iconUrl: 'assets/images/momo.png',
                                          isSelected:
                                              Get.find<PaymentTypeController>()
                                                      .selectedIndex
                                                      .value ==
                                                  0,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.find<PaymentTypeController>()
                                              .selectedIndex
                                              .value = 1;
                                        },
                                        child: PaymentType(
                                          title: 'Locapay',
                                          iconUrl:
                                              'assets/images/logo_black.png',
                                          isSelected:
                                              Get.find<PaymentTypeController>()
                                                      .selectedIndex
                                                      .value ==
                                                  1,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
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

                            /********************************************** */
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Obx(
                              () => Get.find<PaymentTypeController>()
                                          .selectedIndex
                                          .value ==
                                      0
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: const Text(
                                            'Numéro de Retrait',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        MyFormField(
                                            controller: phonecontroller,
                                            testInputType: TextInputType.number,
                                            hintText: 'Entrez le numéro',
                                            leftIcon:
                                                "assets/icons/smartphone.png",
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Entrez votre numéro';
                                              }
                                              return null;
                                            },
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            hasSepBar: false),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: const Text(
                                            'Le numéro de retrait est celui à partir duquel vous comptez faire le paiement par momo.',
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
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: const Text(
                                            'Votre solde: ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${Get.find<WalletController>().balance!.value}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFF00DAB7),
                                                fontSize: 40,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                                height: 0,
                                              ),
                                            ),
                                            const Text(
                                              ' FCFA',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF00DAB7),
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          child: RectActionButton(
                                              icon: "assets/icons/dollar.png",
                                              action: "Recharger",
                                              onPressed: () {
                                                Get.to(() => DepositPage());
                                              }),
                                        )
                                      ],
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
                                  fontSize: 16,
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
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Obx(
                              () => Get.find<PaymentTypeController>()
                                          .paymentType
                                          .value ==
                                      0
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: const Text(
                                        'Cette somme représente l’acompte, le loyer de deux mois, payé en garantie au propriétaire et qui vous permet d’avoir un maximum de deux mois d’arriéré.',
                                        style: TextStyle(
                                          color: Color(0xFFFF0202),
                                          fontSize: 11,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    )
                                  : Get.find<PaymentTypeController>()
                                              .paymentType
                                              .value ==
                                          1
                                      ? SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: const Text(
                                            'Cette somme représente le loyer du mois en cours.',
                                            style: TextStyle(
                                              color: Color(0xFF00DAB7),
                                              fontSize: 11,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: const Text(
                                            'Cette somme représente le paiement d\'un service.',
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ActionButton(
                                  action: "Valider",
                                  onPressed: () {
                                    Get.defaultDialog(
                                      radius: 10,
                                      titlePadding: const EdgeInsets.all(20),
                                      title:
                                          'Voulez-vous vraiment payer ${amountcontroller.value.text} FCFA du loyer ?',
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
                                        onTap: () {
                                          Get.find<WalletController>()
                                                  .balance!
                                                  .value =
                                              Get.find<WalletController>()
                                                      .balance!
                                                      .value +
                                                  int.parse(
                                                      amountcontroller.text);
                                          Get.back();
                                          Get.defaultDialog(
                                            title: '',
                                            contentPadding: EdgeInsets.zero,
                                            //backgroundColor: white with transparancy of 0.5
                                            backgroundColor: const Color(
                                                0x03FFFFFF), // white with transparancy of 0.5
                                            radius: 10,
                                            content: PaymentDone(),
                                          );
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
