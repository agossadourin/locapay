import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/search_location/item_details.dart';
import 'package:locapay/app/modules/principal/widgets/filter_button.dart';
import 'package:locapay/app/widgets/action_button.dart';

import '../widgets/item_widget.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  title: const Text(
                    'Résultat de Recherche',
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
                      icon: const Icon(Icons.notifications),
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
                      child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const Text(
                          'Voici les meilleures résultats',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 15,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Haie Vive',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF303030),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '04 Chambres',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF303030),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '08 Salons',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 15,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Sanitaire',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF303030),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Meublée',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF303030),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Travaux Autorisées',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
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
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      //row scrollable list
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.2),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Get.to(() => ItemDetails());
                                },
                                child: const ItemWidget());
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
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
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      const FilterButton(
                          text: 'Afficher à partir du moins cher',
                          icon: 'assets/icons/sort_min.png'),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.025,
                      ),
                      const FilterButton(
                          text: 'Afficher à partir du mieux noté',
                          icon: 'assets/icons/sort_max.png'),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      ActionButton(
                          action: "Revoir les critères de recherche",
                          onPressed: () {
                            Get.back();
                          })
                    ],
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
