import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/my_locations/my_locations.dart';
import 'package:locapay/app/modules/principal/notifications_page/notifications_page.dart';
import 'package:locapay/app/modules/principal/search_location/search_results.dart';
import 'package:locapay/app/modules/principal/search_location/search_location.dart';
import 'package:locapay/app/modules/principal/welcome/welcome_page.dart';
import 'package:locapay/app/modules/principal/widgets/custom_drawer.dart';

import 'controllers/principal_controller.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add background image
      drawer: const CustomDrawer(),
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
                    'Bienvenue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF313131),
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
                  child: SingleChildScrollView(
                      child: Obx(
                    () => Get.find<PrincipalController>().currentPage.value == 0
                        ? const WelcomePage()
                        : Get.find<PrincipalController>().currentPage.value == 1
                            ? const MyLocations()
                            : const Text('contrats'),
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
