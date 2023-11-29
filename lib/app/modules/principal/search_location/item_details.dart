import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/models/location_model.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';
import 'package:locapay/app/modules/principal/search_location/widgets/charateristics_widget.dart';
import 'package:locapay/app/modules/principal/widgets/picture_viewer.dart';
import 'package:locapay/app/widgets/action_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetails extends StatelessWidget {
  final Location? location;
  const ItemDetails({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final double anualRent = double.parse(location!.monthlyRent) * 11.8;
    final int roundedAnualRent = anualRent.round();

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
                      PictureViewer(
                        location: location!,
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
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharateristicsWidget(
                              icon: 'assets/icons/proprietaire2.png',
                              text1: 'Propriétaire',
                              text2: location!.propertyFirstName,
                              text3: ' +229 ${location!.ownerPhone}',
                              isLeft: true,
                            ),
                            CharateristicsWidget(
                              icon: 'assets/icons/location.png',
                              text1: 'Localisation',
                              text2: location!.cityId.toString(),
                              text3: 'Face ci gus..',
                              isLeft: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharateristicsWidget(
                              icon: 'assets/icons/money2.png',
                              text1: 'Loyer',
                              text2: '${location!.monthlyRent} FCFA (mensuel)',
                              text3: '$roundedAnualRent FCFA (annuel)',
                              isLeft: true,
                            ),
                            CharateristicsWidget(
                              icon: 'assets/icons/feedback.png',
                              text1: 'Evaluation',
                              text2: 'Générale : ${location!.generalRating}/10',
                              text3: 'LocaPay : ${location!.rating}/10',
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
                        children: location!.mainFeatures
                            .map((el) => Column(
                                  children: [
                                    Text(
                                      el.name,
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
                      Column(
                        children: location!.secondaryFeatures
                            .map((el) => Column(
                                  children: [
                                    Text(
                                      el.name,
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
                        child: Text(
                          location!.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                      ActionButton(
                          action: 'Contacter le propriétaire',
                          onPressed: () {
                            Get.find<WalletController>().debt.value =
                                double.parse(location!.monthlyRent);
                            void _launchURL(String phoneNumber) async {
                              String url = 'tel:$phoneNumber';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }

// ...

                            _launchURL(location!.ownerPhone);
                          }),
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
