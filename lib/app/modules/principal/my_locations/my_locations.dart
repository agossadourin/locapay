import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/my_locations/controllers/locations_controller.dart';
import 'package:locapay/app/modules/principal/my_locations/my_location_details.dart';
import 'package:locapay/app/modules/principal/my_locations/widgets/location_item.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';

class MyLocations extends StatelessWidget {
  const MyLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              'Mes Locations',
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Obx(
            () => Wrap(
              direction: Axis.horizontal, // use horizontal direction
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: <Widget>[
                // your widgets go here
                GestureDetector(
                  onTap: () {
                    Get.find<LocationsController>().selectedIndex.value = 0;
                    Get.to(() => const MyLocationDetails());
                  },
                  child: LocationItem(
                    title: 'Maison ADJILAN',
                    iconUrl: 'assets/icons/house.png',
                    isSelected:
                        Get.find<LocationsController>().selectedIndex.value == 0
                            ? true
                            : false,
                  ),
                )
                // more widgets...
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        RectActionButton(
            action: 'Rechercher une nouvelle location',
            onPressed: () {},
            icon: 'assets/icons/home_search.png')
      ],
    );
  }
}
