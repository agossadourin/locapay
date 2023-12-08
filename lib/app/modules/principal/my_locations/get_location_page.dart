import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/contracts/contract_page.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/my_locations/controllers/locations_controller.dart';
import 'package:locapay/app/modules/principal/my_locations/qr_scan_page.dart';
import 'package:locapay/app/widgets/my_form_field.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class GetLocationPage extends StatelessWidget {
  GetLocationPage({super.key});
  final GlobalKey qrKey = GlobalKey();
  void _onQRViewCreated(QRViewController controller) {
    // Handle the QRViewController...
  }
  TextEditingController idController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/house_bg.png"), // replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                AppBar(
                  title: const Text(
                    'Ajouter une location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  centerTitle: true,
                  // green with opacity of 0.5
                  backgroundColor:
                      const Color(0xFF00DBB7), // green with opacity of 0.5
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          const Text(
                            'Pour ajouter une location, vous devez d\'abord signer un contrat avec le propriétaire. \n Entrez l\'id de la location ou scannez directement le qr code pour voir le contrat.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              'ID de la location',
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyFormField(
                                  controller: idController,
                                  testInputType: TextInputType.number,
                                  hintText: 'Id de la location',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Entrez l\'id de la location svp';
                                    }
                                    return null;
                                  },
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  hasSepBar: false),
                              IconButton(
                                icon: const Icon(Icons
                                    .qr_code_scanner), // Replace with your barcode scan icon
                                onPressed: () {
                                  Get.to(() => QrScanPage());
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          RectActionButton(
                              icon: 'assets/icons/contract.png',
                              action: "Ajouter la location",
                              onPressed: () async {
                                String token = Get.find<UserController>()
                                    .userData
                                    .value!
                                    .token
                                    .split("|")[1];
                                var answer = await authService.getALocation(
                                    token, int.parse(idController.text));

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
                                  print("locationdata: $answer");
                                  print(answer);
                                  Get.to(() => ContractPage(
                                        locationName: answer,
                                        isSigned: false,
                                      ));
                                }

                                const CircularProgressIndicator();
                              }),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
