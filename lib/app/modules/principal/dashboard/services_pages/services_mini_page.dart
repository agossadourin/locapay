import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/services_search_results.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/widgets/service_item.dart';

import '../../../../widgets/action_button_2.dart';
import 'controllers/services_item_controller.dart';

class ServicesMiniPage extends StatelessWidget {
  const ServicesMiniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: const Text(
            'Rechercher des artisans dans votre\nlocalité pour des prestation à domicile.',
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
          height: MediaQuery.of(context).size.height * 0.03,
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
        Obx(
          () => Wrap(
            direction: Axis.horizontal, // use horizontal direction
            spacing: 10.0, // gap between adjacent chips
            runSpacing: 10.0, // gap between lines
            children: <Widget>[
              // your widgets go here

              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 0;
                },
                child: ServiceItem(
                    title: 'Menuisier/charpentier',
                    iconUrl: "assets/icons/carpenter.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        0),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 1;
                },
                child: ServiceItem(
                    title: 'Maçon',
                    iconUrl: "assets/icons/worker.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        1),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 2;
                },
                child: ServiceItem(
                    title: 'Soudeur',
                    iconUrl: "assets/icons/welder.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        2),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 3;
                },
                child: ServiceItem(
                    title: 'Electricien',
                    iconUrl: "assets/icons/electricity.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        3),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 4;
                },
                child: ServiceItem(
                    title: 'Plombier',
                    iconUrl: "assets/icons/plumber.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        4),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 5;
                },
                child: ServiceItem(
                    title: 'Agent d\'entretien',
                    iconUrl: "assets/icons/household.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        5),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<ServicesItemController>().selectedIndex.value = 6;
                },
                child: ServiceItem(
                    title: 'Lavandière/Pressing',
                    iconUrl: "assets/icons/laundry.png",
                    isSelected: Get.find<ServicesItemController>()
                            .selectedIndex
                            .value ==
                        6),
              ),
              // more widgets...
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
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
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ActionButton2(
            action: 'Chercher',
            onPressed: () {
              Get.to(() => const ServicesSearchResults());
            },
            icon: 'assets/icons/search.png',
          ),
        )
      ],
    );
  }
}
