import 'package:flutter/material.dart';
import 'package:locapay/app/widgets/my_dropdown_form_field2.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String? month;
  String? year;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mois',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // your style here
                    ),
              ),

              MyDropdownFormField2(
                leftIcon: 'assets/icons/calendar_2.png',
                rightIcon: 'assets/icons/arrow_down.png',
                hintText: 'Mois',
                hasSepBar: false,
                items: const [
                  'Janvier',
                  'Février',
                  'Mars',
                  'Avril',
                  'Mai',
                  'Juin',
                  'Juillet',
                  'Aout',
                  'Septembre',
                  'Novembre',
                  'Décembre'
                ],
                width: MediaQuery.of(context).size.width * 0.425,
                onChanged: (String? value) {
                  setState(() {
                    month = value;
                  });
                },
              ),
              // your other widgets here
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.025),
          Container(
            width: 1,
            height: MediaQuery.of(context).size.height * 0.08,
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
          SizedBox(width: MediaQuery.of(context).size.width * 0.025),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mois',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // your style here
                    ),
              ),

              MyDropdownFormField2(
                leftIcon: 'assets/icons/calendar_3.png',
                rightIcon: 'assets/icons/arrow_down.png',
                hintText: 'Année',
                hasSepBar: false,
                items: const [
                  '2023',
                ],
                width: MediaQuery.of(context).size.width * 0.425,
                onChanged: (String? value) {
                  setState(() {
                    month = value;
                  });
                },
              ),
              // your other widgets here
            ],
          ),
        ],
      ),
    );
  }
}
