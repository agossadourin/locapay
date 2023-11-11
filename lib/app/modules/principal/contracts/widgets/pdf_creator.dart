import 'dart:io';
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

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mypdf.pdf');

    await file.writeAsBytes(bytes);

    return file;
  }
}
