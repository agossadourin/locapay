import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/search_location/search_results.dart';
import 'package:locapay/app/modules/register/controllers/locations_data_controller.dart';
import 'package:locapay/app/widgets/action_button_2.dart';
import 'package:locapay/app/widgets/my_dropdown_form_field.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  TextEditingController villeController = TextEditingController();
  TextEditingController nbreChambreController = TextEditingController();
  TextEditingController nbreSalonController = TextEditingController();
  TextEditingController margeLoyerController = TextEditingController();
  bool isChecked = false;
  AuthService authService = AuthService();
  final loginInProgress = ValueNotifier<bool>(false);

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
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.025,
            ),
            MyDropdownFormField(
                leftIcon: 'assets/icons/furniture.png',
                hintText: 'Nombre de salons',
                items: const ['1', '2', '3', '4', '5', '6', '7', '8', '+'],
                onChanged: (String? value) {
                  print('Selected: $value');
                },
                width: MediaQuery.of(context).size.width * 0.85,
                rightIcon: 'assets/icons/arrow_down.png',
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 1,
              color: const Color.fromRGBO(0, 0, 0, 0.25),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            MyDropdownFormField(
                leftIcon: 'assets/icons/money.png',
                hintText: 'Marge de loyer',
                items: const ['1', '2', '3', '4', '5', '6', '7', '8', '+'],
                onChanged: (String? value) {
                  print('Selected: $value');
                },
                width: MediaQuery.of(context).size.width * 0.85,
                rightIcon: 'assets/icons/arrow_down.png',
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 1,
              color: const Color.fromRGBO(0, 0, 0, 0.25),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Option.s Supplémentaire.s',
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
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Simple Entrée-Couchée',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Meublée / Equipée',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Avec Cuisine & Douche',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Ordinaire',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Sanitaire',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                    ),
                    //checkbox
                    child: Checkbox(
                      value: isChecked, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          isChecked = value!; // Replace with your variable
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Avec travaux autorisés (grilles, serrures etc)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
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
            ActionButton2(
                action: 'Rechercher',
                icon: 'assets/icons/home_search.png',
                onPressed: () async {
                  setState(() {
                    loginInProgress.value = true;
                  });
                  String token = Get.find<UserController>()
                      .userData
                      .value!
                      .token
                      .split("|")[1];
                  print("token : $token");
                  var answer = await authService.getAllLocation(token);
                  setState(() {
                    loginInProgress.value = false;
                  });

                  if (answer is DioException) {
                    // Handle the exception...
                    print('Error message: $answer');

                    //show alert dialog
                    Get.defaultDialog(
                      title: 'Error',
                      middleText: answer.toString(),
                      onConfirm: () => Get
                          .back(), // Navigate back when the confirm button is pressed
                    );
                  } else if (answer is Exception) {
                    // Handle the exception...
                    print('Error: ${answer.toString()}');
                    //show alert dialog
                    Get.defaultDialog(
                      title: 'Error',
                      middleText: answer.toString(),
                      onConfirm: () => Get
                          .back(), // Navigate back when the confirm button is pressed
                    );
                  } else {
                    print("***********loc data************\n\n");
                    print("locationsdata: $answer");
                    print(answer);
                    Get.find<LocationsDataController>().locationsData.value =
                        answer;
                    Get.to(() => const SearchResults());
                  }

                  const CircularProgressIndicator();
                }),
            loginInProgress.value
                ? const CircularProgressIndicator()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
