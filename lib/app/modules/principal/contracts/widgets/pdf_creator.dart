import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PdfCreator {
  static Future<File> generate(List<pw.Widget> widget) async {
    final pdf = pw.Document();

    Future<pw.MemoryImage> _loadImage() async {
      final imageFile = Get.find<FileController>().signFile.value;
      final imageBytes =
          imageFile != null ? await imageFile.readAsBytes() : null;

      final imageBytes2 = await rootBundle.load('assets/images/o.png');

      if (imageBytes != null) {
        return pw.MemoryImage(imageBytes.buffer.asUint8List());
      } else {
        return pw.MemoryImage(imageBytes2.buffer.asUint8List());
      }
    }

    final imageBytes3 =
        await rootBundle.load('assets/icons/bill_certification.png');
    final certification = pw.MemoryImage(imageBytes3.buffer.asUint8List());

    final image = await _loadImage();

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => <pw.Widget>[
        for (pw.Widget item in widget)
          pw.Container(
            child: item,
          ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Container(
            width: 150,
            height: 70,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: image,
                fit: pw.BoxFit.cover,
              ),
            ),
          ),
          pw.SizedBox(width: 5),
          pw.Container(
            width: 150,
            height: 70,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: image,
                fit: pw.BoxFit.cover,
              ),
            ),
          ),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
          pw.Container(
            width: 25,
            height: 25,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: certification,
                fit: pw.BoxFit.cover,
              ),
            ),
          ),
        ])
      ],
    ));

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mypdf.pdf');

    await file.writeAsBytes(bytes);

    return file;
  }
}
