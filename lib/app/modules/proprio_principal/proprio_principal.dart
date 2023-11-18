import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/widgets/welcome_page.dart';
import 'package:locapay/app/modules/principal/notifications_page/notifications_page.dart';
import 'package:locapay/app/modules/proprio_principal/dashboard/proprio_dashboard.dart';
import 'package:locapay/app/modules/proprio_principal/widgets/proprio_custom_drawer.dart';

import 'controllers/proprio_principal_controller.dart';

class ProprioPrincipal extends StatelessWidget {
  const ProprioPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pageTitles = [
      'Finances',
      'Mes Recus',
      'Mes Locations',
      'Services',
      'Modifier mon profil',
      'Règlement des propriétaires',
      'A propos de LocaPay'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      //add background image
      drawer: const ProprioCustomDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  title: Obx(
                    () => Text(
                      pageTitles[Get.find<ProprioPrincipalController>()
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
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Obx(
                    () => Get.find<ProprioPrincipalController>()
                                .currentPage
                                .value ==
                            0
                        ? Get.find<ProprioPrincipalController>()
                                    .hasLocation
                                    .value ==
                                false
                            ? const WelcomePage()
                            : const ProprioDashBoard()
                        : Get.find<ProprioPrincipalController>()
                                    .currentPage
                                    .value ==
                                1
                            ? const Text('Bill page')
                            : Get.find<ProprioPrincipalController>()
                                        .currentPage
                                        .value ==
                                    2
                                ? const Text('Locations page')
                                : Get.find<ProprioPrincipalController>()
                                            .currentPage
                                            .value ==
                                        3
                                    ? const Text('Services page')
                                    : Get.find<ProprioPrincipalController>()
                                                .currentPage
                                                .value ==
                                            4
                                        ? const Text('Edit Profile page')
                                        : Get.find<ProprioPrincipalController>()
                                                    .currentPage
                                                    .value ==
                                                5
                                            ? const Text(
                                                'Règlement des proprio')
                                            : const Text('About page'),
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
