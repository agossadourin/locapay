import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/contact_us/widgets/contact_us_item.dart';
import 'package:locapay/app/widgets/action_button.dart';

import 'contact_us_message_page.dart';

// ignore: must_be_immutable
class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});

  RxInt selectedIndex = 0.obs;
  final List<String> titles = [
    'Rapport de rencontre avec un propriétaire',
    'Rapport de travaux avec un artisan',
    'Plainte',
    'Suggestion'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
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
                'Nous écrire',
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
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
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/decision_making.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          height: 25,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF303030),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const Text(
                            'Pourquoi nous écrivez vous ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Obx(() => Wrap(
                            direction:
                                Axis.horizontal, // use horizontal direction
                            spacing: 10.0, // gap between adjacent chips
                            runSpacing: 10.0, // gap between lines
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  selectedIndex.value = 0;
                                },
                                child: ContactUsItem(
                                  title:
                                      'Rapport de rencontre avec un propriétaire',
                                  iconUrl: "assets/icons/conversation.png",
                                  isSelected: selectedIndex.value == 0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectedIndex.value = 1;
                                },
                                child: ContactUsItem(
                                  title: 'Rapport de travaux avec un artisan',
                                  iconUrl: "assets/icons/rapport.png",
                                  isSelected: selectedIndex.value == 1,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectedIndex.value = 2;
                                },
                                child: ContactUsItem(
                                  title: 'Plainte',
                                  iconUrl: "assets/icons/sad.png",
                                  isSelected: selectedIndex.value == 2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectedIndex.value = 3;
                                },
                                child: ContactUsItem(
                                  title: 'Suggestion',
                                  iconUrl: "assets/icons/advice.png",
                                  isSelected: selectedIndex.value == 3,
                                ),
                              ),
                            ])),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ActionButton(
                            action: 'Ecrire',
                            onPressed: () {
                              Get.to(() => ContactUsMessagePage(
                                    messageType: selectedIndex.value,
                                    title: titles[selectedIndex.value],
                                  ));
                            }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
