import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PdfCreator {
  static Future<File> generate(List<pw.Widget> widget) async {
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => <pw.Widget>[
        for (pw.Widget item in widget)
          pw.Container(
            child: item,
          ),
      ],
    ));
    Future<pw.MemoryImage> _loadImage() async {
      final imageBytes =
          await rootBundle.load('assets/images/welcome_bg_img.png');
      return pw.MemoryImage(imageBytes.buffer.asUint8List());
    }

    final image = await _loadImage();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Container(
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
              image: image,
              fit: pw.BoxFit.cover,
            ),
          ),
        ),
      ),
    );
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => <pw.Widget>[
        for (pw.Widget item in widget)
          pw.Container(
            child: item,
          ),
      ],
    ));

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mypdf.pdf');

    await file.writeAsBytes(bytes);

    return file;
  }
}
