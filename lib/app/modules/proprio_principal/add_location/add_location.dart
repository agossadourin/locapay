import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/proprio_principal/controllers/proprio_principal_controller.dart';
import 'package:locapay/app/modules/proprio_principal/proprio_principal.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:locapay/app/widgets/action_button_2.dart';
import 'package:locapay/app/widgets/add_multi_photo_widget.dart';
import 'package:locapay/app/widgets/my_dropdown_form_field.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController locationNameController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController nbreChambreController = TextEditingController();
  TextEditingController nbreSalonController = TextEditingController();
  TextEditingController margeLoyerController = TextEditingController();
  TextEditingController locationAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final loginInProgress = ValueNotifier<bool>(false);
  AuthService authService = AuthService();

  List<int> mainFeatures = [];
  List<int> secondaryFeatures = [];

  String city = "";
  bool p1 = false;

  bool p2 = false;
  bool p3 = false;
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Get.defaultDialog(
        radius: 10,
        titlePadding: const EdgeInsets.all(20),
        title: 'Bien Recu',
        titleStyle: const TextStyle(
          color: Color(0xFF00DAB7),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
        content: const Text(
          'Après étude des informations fournies, une équipe sera envoyé pour contrôle de conformité. Après quoi, votre nouvel location sera rajouter à la base de données.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontStyle: FontStyle.italic,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        confirm: GestureDetector(
          onTap: () {
            Get.find<ProprioPrincipalController>().hasLocation.value = true;
            Get.to(() => const ProprioPrincipal());
          },
          child: Container(
            width: 103,
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: ShapeDecoration(
              color: const Color(0xFF00DAB7),
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
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'D’accord',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajouter une location',
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
            const Color(0xFF00DAB7), // make AppBar background transparent
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
                'Caractéristiques de la location',
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
                leftIcon: 'assets/icons/house_black.png',
                controller: locationNameController,
                testInputType: TextInputType.text,
                hintText: 'Nom de la location',
                validator: null,
                width: MediaQuery.of(context).size.width * 0.85,
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            MyDropdownFormField(
              leftIcon: 'assets/icons/home_location.png',
              rightIcon: 'assets/icons/arrow_down.png',
              hintText: 'Ville d\'intervention',
              hasSepBar: true,
              items: const [
                'Akpakpa',
                'Cadjehoun',
                'Gbegamey',
                'Houeyiho',
                'Fidjrossè',
                'Agla',
                'Godomey',
                'Tanpkè',
                'Houèto',
                'Aitchedji'
              ],
              width: MediaQuery.of(context).size.width * 0.9,
              onChanged: (String? value) {
                if (value == 'Akpakpa') {
                  setState(() {
                    city = '1';
                  });
                } else if (value == 'Cadjehoun') {
                  setState(() {
                    city = '2';
                  });
                } else if (value == 'Gbegamey') {
                  setState(() {
                    city = '3';
                  });
                } else if (value == 'Houeyiho') {
                  setState(() {
                    city = '4';
                  });
                } else if (value == 'Fidjrossè') {
                  setState(() {
                    city = '5';
                  });
                } else if (value == 'Agla') {
                  setState(() {
                    city = '6';
                  });
                } else if (value == 'Godomey') {
                  setState(() {
                    city = '7';
                  });
                } else if (value == 'Tanpkè') {
                  setState(() {
                    city = '8';
                  });
                } else if (value == 'Houèto') {
                  setState(() {
                    city = '9';
                  });
                } else if (value == 'Aitchedji') {
                  setState(() {
                    city = '10';
                  });
                }
              },
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
            MyDropdownFormField(
                leftIcon: 'assets/icons/bedroom.png',
                hintText: 'Nombre de chambres',
                items: const ['1', '2', '3', '4', '5', '6', '7', '8'],
                onChanged: (String? value) {},
                width: MediaQuery.of(context).size.width * 0.85,
                rightIcon: 'assets/icons/arrow_down.png',
                hasSepBar: true),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.025,
            ),
            MyDropdownFormField(
                leftIcon: 'assets/icons/furniture.png',
                hintText: 'Nombre de salons',
                items: const ['1', '2', '3', '4', '5', '6', '7', '8'],
                onChanged: (String? value) {},
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
            MyFormField(
                leftIcon: 'assets/icons/money.png',
                controller: locationAmountController,
                testInputType: TextInputType.text,
                hintText: 'Montant du loyer',
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
                      value: p1, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          p1 = value!; // Replace with your variable
                          if (p1) {
                            if (mainFeatures.contains(1) == false) {
                              mainFeatures.add(1);
                            }
                          } else {
                            if (mainFeatures.contains(1)) {
                              mainFeatures.remove(1);
                            }
                          }
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
                      value: p2, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          p2 = value!; // Replace with your variable
                          if (p2) {
                            if (mainFeatures.contains(2) == false) {
                              mainFeatures.add(2);
                            }
                          } else {
                            if (mainFeatures.contains(2)) {
                              mainFeatures.remove(2);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Avec douche',
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
                      value: p3, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          p3 = value!; // Replace with your variable
                          if (p3) {
                            if (mainFeatures.contains(3) == false) {
                              mainFeatures.add(3);
                            }
                          } else {
                            if (mainFeatures.contains(3)) {
                              mainFeatures.remove(3);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Avec arrière cour',
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
                      value: s1, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          s1 = value!; // Replace with your variable
                          if (s1) {
                            if (secondaryFeatures.contains(1) == false) {
                              secondaryFeatures.add(1);
                            }
                          } else {
                            if (secondaryFeatures.contains(1)) {
                              secondaryFeatures.remove(1);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'cuisine',
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
                      value: s2, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          s2 = value!; // Replace with your variable
                          if (s2) {
                            if (secondaryFeatures.contains(2) == false) {
                              secondaryFeatures.add(2);
                            }
                          } else {
                            if (secondaryFeatures.contains(2)) {
                              secondaryFeatures.remove(2);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Salle à manger',
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
                      value: s3, // Replace with your variable
                      onChanged: (bool? value) {
                        // Handle when the checkbox is clicked
                        setState(() {
                          s3 = value!; // Replace with your variable
                          if (s3) {
                            if (secondaryFeatures.contains(3) == false) {
                              secondaryFeatures.add(3);
                            }
                          } else {
                            if (secondaryFeatures.contains(3)) {
                              secondaryFeatures.remove(3);
                            }
                          }
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
            /////////////////////////////////////////

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Autres caractéristiques',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Donnez des caractéristiques supplémentaires à rajouter pour mettre en valeur votre location.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.50,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(75),
                ),
              ),
              child: Text(
                'Ajouter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
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
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text(
                'Description',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Décrivez votre location en mettant l’accent sur les points fort afin de convaincre les futurs locataires.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.50,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Veillez à ne rien dire de mensonger car toutes les informations ici données seront vérifiées par nos équipe de certification de logement.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF0202),
                  fontSize: 12.50,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ecrivez ici',
                  hintStyle: TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
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
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Text(
                'Photos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 55,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Ajouter ou supprimez des photos des locations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.50,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Veillez à prendre des photos assez claires des compartiments de la location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFF0202),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            const AddMultiPhotoWidget(),

            /////////////////////////////////////////

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            ActionButton2(
                action: 'Ajouter la location',
                icon: 'assets/icons/home_add.png',
                onPressed: () async {
///////////////////////////////////////////////////////////////

                  setState(() {
                    loginInProgress.value = true;
                  });
                  List<String> galleries = Get.find<FileController>()
                      .renttempFilePaths
                      .map((rxString) => rxString.value)
                      .toList();
                  print('galleries: $galleries');

                  String input =
                      Get.find<UserController>().userData.value!.token;
                  String token = input.split("|")[1];
                  print('token: $input');
                  print('token: ${locationNameController.text}');
                  var answer = await authService.addLocation(
                      'Maison',
                      locationNameController.text,
                      city,
                      locationAmountController.text,
                      descriptionController.text,
                      Get.find<UserController>().userData.value!.phone,
                      0,
                      9,
                      8,
                      7,
                      Get.find<UserController>().userData.value!.id,
                      int.parse(city),
                      galleries,
                      mainFeatures,
                      secondaryFeatures,
                      token);

                  setState(() {
                    loginInProgress.value = false;
                  });

                  if (answer is DioException) {
                    // Handle the exception...
                    print('Error message: ${answer.message}');
                    print('Error data: ${answer.response?.data}');
                    //show alert dialog
                    Get.defaultDialog(
                      title: 'Error',
                      middleText: answer.response!.data.toString(),
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
                    Get.find<ProprioPrincipalController>().hasLocation.value =
                        true;
                    Get.defaultDialog(
                      title: 'Succès!',
                      middleText: 'Votre location a été ajouté avec succès',
                      onConfirm: () => Get.off(() =>
                          const ProprioPrincipal()), // Navigate back when the confirm button is pressed
                    );
                  }

                  const CircularProgressIndicator();
//////////////////////////////////////////////////////////////
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
