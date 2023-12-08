import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/contracts/contract_page.dart';
import 'package:locapay/app/modules/proprio_principal/add_location/add_location.dart';
import 'package:locapay/app/modules/proprio_principal/my_locations_pages/qr_genaration_page.dart';
import 'package:locapay/app/modules/proprio_principal/my_locations_pages/widgets/owner_location_item.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

class InactiveLocationsMiniPage extends StatelessWidget {
  const InactiveLocationsMiniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: const Text(
            '1/5',
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
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.arrow_circle_up_rounded,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const OwnerLocationItem(
          title: 'Maison ZOCA, chambre 8',
          id: "#AB_C-Zc28",
          nbRooms: 1,
          nbLivingRooms: 3,
          occupant: "Assadou Adam",
          occupationStartDate: ' 20 Juin 2022',
          amount: 12125,
          nextPaymentDate: "1er Decembre 2023",
          isOccuped: false,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        //cirle button with arrow_down icon
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.arrow_circle_down_rounded,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ActionButton2(
            action: 'Editer',
            onPressed: () {
              Get.to(() => const AddLocation());
            },
            icon: 'assets/icons/edit.png',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => QrGenerationPage());
          },
          child: Container(
            width: 183,
            height: 41,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: const Color(0xFFFF0202),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Colors.blue, // Replace with your desired color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.qr_code,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
