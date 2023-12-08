import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/contracts/contract_page.dart';
import 'package:locapay/app/modules/proprio_principal/my_locations_pages/widgets/owner_location_item.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

class ActiveLocationsMiniPage extends StatelessWidget {
  const ActiveLocationsMiniPage({super.key});

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
          title: 'Maison ZOCA, chambre 1',
          id: "#AB_C-Zc28",
          nbRooms: 1,
          nbLivingRooms: 3,
          occupant: "Assadou Adam",
          occupationStartDate: ' 20 Juin 2022',
          amount: 12125,
          nextPaymentDate: "1er Decembre 2023",
          isOccuped: true,
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
            action: 'Contrat',
            onPressed: () {
              Get.to(
                  () => ContractPage(locationName: " ADJIBI", isSigned: true));
            },
            icon: 'assets/icons/contract.png',
          ),
        )
      ],
    );
  }
}
