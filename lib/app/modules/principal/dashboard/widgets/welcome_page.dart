import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

import '../../search_location/search_location.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pour commencer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ActionButton2(
              action: 'Rechercher une location',
              icon: 'assets/icons/home_search.png',
              onPressed: () {
                Get.to(() => const SearchLocation());
              },
            ),
            const SizedBox(
              width: 310,
              child: Text(
                'Si vous avez déjà rencontrer un propriétaire, patientez qu\'il lance un contrat de location à votre nom. Une fois cela fait, vous devriez recevoir une notification.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            )
          ],
        ));
  }
}
