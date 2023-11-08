import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/widgets/charateristics_widget.dart';
import 'package:locapay/app/modules/principal/widgets/picture_viewer.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List caractSup = [
      '3 chambres',
      'Piscine',
      'Parking',
      'Wifi',
      'Climatisation',
      'Balcon',
      '3 chambres',
      'Piscine',
      'Parking',
      'Wifi',
      'Climatisation',
      'Balcon'
    ];
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
                  'Détails',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const PictureViewer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
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
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharateristicsWidget(
                              icon: 'assets/icons/proprietaire2.png',
                              text1: 'Propriétaire',
                              text2: 'ADJIBI',
                              text3: 'Julian Exaucée',
                              isLeft: true,
                            ),
                            CharateristicsWidget(
                              icon: 'assets/icons/location.png',
                              text1: 'Localisation',
                              text2: 'Haie vive',
                              text3: 'Face ci gus..',
                              isLeft: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharateristicsWidget(
                              icon: 'assets/icons/money2.png',
                              text1: 'Loyer',
                              text2: '90 000 FCFA (mensuel)',
                              text3: '1 050 000 FCFA (annuel)',
                              isLeft: true,
                            ),
                            CharateristicsWidget(
                              icon: 'assets/icons/feedback.png',
                              text1: 'Evaluation',
                              text2: 'Générale : 8.5/10',
                              text3: 'LocaPay : 8/10',
                              isLeft: false,
                            ),
                          ],
                        ),
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
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Caractéristiques Supplémentaires',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Column(
                        children: caractSup
                            .map((el) => Column(
                                  children: [
                                    Text(
                                      el,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      width: 3,
                                      height: 3,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF00DAB7),
                                        shape: OvalBorder(),
                                      ),
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
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
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Description',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Maison chic luxueuse au bord de la voie, un joyau scintillant niché dans un cadre idyllique.\nElle est une invitation à la détente et à la relaxation avec un voisinage discret et offre une belle vue sur l’extérieur.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
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
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'NB',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Les quelques critères ici présentés ont été recueillis lors des enquête des équipe spécialisées de Locapay.\nPour en savoir plus, veuillez prendre rendez-vous avec le propriétaire',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
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
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      ActionButton2(
                          action: 'Contacter le propriétaire',
                          onPressed: () {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
