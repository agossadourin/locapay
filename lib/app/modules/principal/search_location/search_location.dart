import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/widgets/my_dropdown_form_field.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  TextEditingController _searchController = TextEditingController();

  void _onSearchPressed() {
    // TODO: Implement search functionality
  }

  void _onResultSelected(int index) {
    // TODO: Implement selection of search result
  }

  TextEditingController villeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rechercher une location',
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
        backgroundColor: Colors.green, // make AppBar background transparent
        elevation: 0,

        //menu hamburger with notification button at the right and title centered
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'Critères de Recherche',
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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyFormField(
                leftIcon: 'assets/icons/home_location.png',
                controller: villeController,
                testInputType: TextInputType.text,
                hintText: 'Localité/Ville',
                validator: null,
                width: MediaQuery.of(context).size.width * 0.85,
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 1,
              color: const Color.fromRGBO(0, 0, 0, 0.25),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            MyDropdownFormField(
                leftIcon: 'assets/icons/bedroom.png',
                hintText: 'Nombre de chambres',
                items: const ['1', '2', '3', '4', '5', '6', '7', '8', '+'],
                onChanged: (String? value) {
                  print('Selected: $value');
                },
                width: MediaQuery.of(context).size.width * 0.85,
                rightIcon: 'assets/icons/arrow_down.png',
                hasSepBar: true)
          ],
        ),
      ),
    );
  }
}
