import 'package:flutter/material.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          onPressed: () {},
        )
      ],
    ));
  }
}
