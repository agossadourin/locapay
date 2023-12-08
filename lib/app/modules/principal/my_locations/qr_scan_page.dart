import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/contracts/contract_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/user_controller.dart';
import 'controllers/locations_controller.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  AuthService authService = AuthService();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scan Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      // Handle the scanned QR code data
      print(scanData.code);
      if (scanData.code != null) {
        Get.find<LocationsController>().qrDATA.value = scanData.code!;
        String token =
            Get.find<UserController>().userData.value!.token.split("|")[1];
        var answer =
            await authService.getALocation(token, int.parse(scanData.code!));

        if (answer is DioException) {
          // Handle the exception...
          print('Error message: $answer');

          //show alert dialog
          Get.defaultDialog(
            title: 'Error',
            middleText: answer.toString(),
            onConfirm: () =>
                Get.back(), // Navigate back when the confirm button is pressed
          );
        } else if (answer is Exception) {
          // Handle the exception...
          print('Error: ${answer.toString()}');
          //show alert dialog
          Get.defaultDialog(
            title: 'Error',
            middleText: answer.toString(),
            onConfirm: () =>
                Get.back(), // Navigate back when the confirm button is pressed
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

        ;
      }
    });
  }
}
