import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/artisans_principal/artisans_rules_page/artisans_rules_page.dart';
import 'package:locapay/app/modules/artisans_principal/dashboard/artisans_dashboard.dart';
import 'package:locapay/app/modules/artisans_principal/widgets/artisans_custom_drawer.dart';
import 'package:locapay/app/modules/principal/about/about_page.dart';
import 'package:locapay/app/modules/principal/edit_profile/edit_profile.dart';
import 'package:locapay/app/modules/principal/notifications_page/notifications_page.dart';

import 'controllers/artisans_principal_controller.dart';

class ArtisansPrincipal extends StatelessWidget {
  const ArtisansPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pageTitles = [
      'Tableau de bord',
      'Modifier mon profil',
      'Règlement des Artisans',
      'A propos de LocaPay'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      //add background image
      drawer: const ArtisansCustomDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  title: Obx(
                    () => Text(
                      pageTitles[Get.find<ArtisansPrincipalController>()
                          .currentPage
                          .value],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF313131),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor:
                      Colors.transparent, // make AppBar background transparent
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const NotificationsPage());
                      },
                      icon: const Image(
                          image: AssetImage('assets/icons/Notifications.png')),
                    )
                  ],
                  //menu hamburger with notification button at the right and title centered
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          //open CustomDrawer
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Obx(
                    () => Get.find<ArtisansPrincipalController>()
                                .currentPage
                                .value ==
                            0
                        ? const ArtisansDashBoard()
                        : Get.find<ArtisansPrincipalController>()
                                    .currentPage
                                    .value ==
                                1
                            ? EditProfile()
                            : Get.find<ArtisansPrincipalController>()
                                        .currentPage
                                        .value ==
                                    2
                                ? const ArtisansRulesPage()
                                : const AboutPage(),
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
