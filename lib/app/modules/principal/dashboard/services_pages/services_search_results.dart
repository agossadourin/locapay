import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/widgets/search_result_item.dart';

class ServicesSearchResults extends StatelessWidget {
  const ServicesSearchResults({super.key});

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
                    'Rechercher un service',
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
                      ////////////////////////////////////////////////////////
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              'Les meilleurs menuisiers/charpentiers de votre localité, certifiés par LocaPay',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Column(
                            children: [
                              SearchResultItem(
                                name: 'Jean',
                                surname: 'Dupont',
                                note: 9.5,
                                image: 'assets/images/o.png',
                              ),
                              SearchResultItem(
                                name: 'Joanna',
                                surname: 'DOE',
                                note: 8.5,
                                image: 'assets/images/1.png',
                              ),
                              SearchResultItem(
                                name: 'Emric',
                                surname: 'CODJO',
                                note: 7.5,
                                image: 'assets/images/2.png',
                              ),
                              SearchResultItem(
                                name: 'Abdul',
                                surname: 'SIRI',
                                note: 6.5,
                                image: 'assets/images/3.png',
                              ),
                              SearchResultItem(
                                name: 'Jophat',
                                surname: 'AMAGBE',
                                note: 5.5,
                                image: 'assets/images/4.png',
                              ),
                              SearchResultItem(
                                name: 'Austin',
                                surname: 'AGOSSA',
                                note: 4.5,
                                image: 'assets/images/5.png',
                              ),
                              SearchResultItem(
                                name: 'Ange',
                                surname: 'KASSA',
                                note: 4.5,
                                image: 'assets/images/6.png',
                              ),
                              SearchResultItem(
                                name: 'Alfreda',
                                surname: 'TOSSAI',
                                note: 4.5,
                                image: 'assets/images/7.png',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                        ],
                      ),
                      ////////////////////////////////////////////////////////
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
