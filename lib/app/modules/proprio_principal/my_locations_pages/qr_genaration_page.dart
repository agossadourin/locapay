import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerationPage extends StatefulWidget {
  @override
  _QrGenerationPageState createState() => _QrGenerationPageState();
}

class _QrGenerationPageState extends State<QrGenerationPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00DAB7),
        title: const Text('Contrat de la location'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'Demandez au locataire de scanner ce code pour intégrer la location',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              child: Center(
                child: QrImageView(data: "1", size: 250),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
