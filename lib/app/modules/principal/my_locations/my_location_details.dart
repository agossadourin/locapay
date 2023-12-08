import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/contracts/contract_page.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';

class MyLocationDetails extends StatelessWidget {
  const MyLocationDetails({super.key});

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
                    "assets/images/house_bg.png"), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: const Text(
                  'Details',
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
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 1,
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
                            const SizedBox(width: 10),
                            const Text(
                              'Maison ADJIBI',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 1,
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
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Container(
                          width: 75,
                          height: 75,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/o.png"), // replace with your image path
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const SizedBox(
                          width: 319.13,
                          height: 38,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 133,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Propriétaire',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF303030),
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ADJIBI',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF303030),
                                                fontSize: 13,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Julian-Exaucé',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF303030),
                                                fontSize: 13,
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
                              ),
                              SizedBox(
                                height: 38,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Début du contrat',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF303030),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '22 Juin 2023',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF303030),
                                                fontSize: 13,
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const SizedBox(
                          width: 319.13,
                          height: 38,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '00229 6751 2140',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF303030),
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Loyer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '47 500 FCFA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF303030),
                                          fontSize: 13,
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
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const SizedBox(
                          width: 319.13,
                          height: 38,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total payé',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '237 500 FCFA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF303030),
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Dette latente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '0 FCFA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF303030),
                                          fontSize: 13,
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
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                        RectActionButton(
                            action: "Toutes les caractéristiques",
                            onPressed: () {},
                            icon: 'assets/icons/features.png'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        RectActionButton(
                            action: "Voir le contrat",
                            onPressed: () {
                              Get.to(() => ContractPage(
                                  locationName: "ADJOVI Simplice",
                                  isSigned: true));
                            },
                            icon: 'assets/icons/contract.png'),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
