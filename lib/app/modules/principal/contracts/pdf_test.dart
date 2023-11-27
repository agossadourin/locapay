import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/contracts/widgets/pdf_creator.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfTest extends StatefulWidget {
  PdfTest({Key? key}) : super(key: key);

  @override
  _PdfTestState createState() => _PdfTestState();
}

class _PdfTestState extends State<PdfTest> {
  late Future<File> file;

  @override
  void initState() {
    super.initState();
  }

  Future<pw.MemoryImage> _loadImage() async {
    final imageBytes =
        await rootBundle.load('assets/images/welcome_bg_img.png');
    return pw.MemoryImage(imageBytes.buffer.asUint8List());
  }

  late final image = _loadImage();

  @override
  Widget build(BuildContext context) {
    List<pw.Widget> testW = [
      pw.Text(
        'Contrat de location',
        style: pw.TextStyle(
          fontSize: 30,
          fontWeight: pw.FontWeight.bold,
          decoration: pw.TextDecoration.underline,
        ),
      ),
      pw.SizedBox(
        height: 20,
      ),
      pw.Text(
          'La technologie a pris une place\n super prépondérante dans nos vies ces dernières années, modifiant en profondeur nos habitudes et notre quotidien. Les smartphones sont devenus des compagnons inséparables qui nous suivent partout, dans nos poches ou au creux de nos mains. Grâce à eux, nous sommes connectés en permanence au monde digital, avec un accès instantané à une masse dinformations inédite dans lhistoire de lhumanité. Les réseaux sociaux nous permettent de partager chaque instant de nos vies et dentretenir le lien avec nos proches, où quils soient. Mais cette hyperconnexion nest pas sans conséquences. Certains dénoncent une forme daddiction qui nous couperait du monde réel, toujours le nez rivé sur nos écrans. Dautres craignent pour la confidentialité de leurs données personnelles, aspirées par les géants du web. Des voix sélèvent également contre les bulles de filtres qui renforceraient nos biais cognitifs, nous enfermant dans des chambres décho idéologiques. Pourtant, refuser par principe les avancées technologiques serait tout aussi dommageable. Lintelligence artificielle recèle des promesses extraordinaires dans le domaine de la santé, avec des systèmes experts capables de poser des diagnostics plus fiables que nimporte quel médecin. Les progrès dans la robotique et lapprentissage machine pourraient également nous libérer des tâches pénibles et répétitives, en déléguant le travail physique à des machines intelligentes.Une chose est sûre, le potentiel de transformation de la révolution numérique est colossal, à la mesure des défis quelle pose.Le développement fulgurant de linternet des objets connectés annonce un monde où chaque élément de notre environnement dialoguera en permanence avec des serveurs distants. Villes, logements, transports, énergie, rien ne sera épargné par cette nouvelle invasion numérique.'),
      pw.SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      pw.Row(children: [
        pw.Text(
          'Fait à ',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          'Cotonou',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.normal,
          ),
        ),
        pw.Text(
          ' le ',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          '24/11/2023',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.normal,
          ),
        ),
      ]),
      pw.SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      pw.Row(children: [
        pw.Text(
          'Signature du locataire',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        pw.Text(
          'Signature du propriétaire',
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ]),
      pw.SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
    ];

    file = PdfCreator.generate(testW);
    final controller = Completer<PDFViewController>();

    //
    //
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/welcome_bg_img.png"), // replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            AppBar(
              title: const Text(
                'Contrat de location',
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
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                      image: AssetImage('assets/icons/Notifications.png')),
                )
              ],
              //menu hamburger with notification button at the right and title centered
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.to(() => const Principal());
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Color(0xFF00DBB7)),
                        left: BorderSide(width: 1.0, color: Color(0xFF00DBB7)),
                        right: BorderSide(width: 1.0, color: Color(0xFF00DBB7)),
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFF00DBB7)),
                      ),
                    ),
                    child: FutureBuilder<File>(
                      future: file,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // Use snapshot.data, which is your File
                          return PDFView(
                            filePath: snapshot.data!.path,
                            autoSpacing: true,
                            enableSwipe: true,
                            pageSnap: true,
                            swipeHorizontal: false,
                            nightMode: false,
                            // onError: (error) {
                            //   print(error.toString());
                            // },
                            // onRender: (_pages) {
                            //   print("All pages are rendered");
                            // },
                            onViewCreated:
                                (PDFViewController pdfViewController) {
                              controller.complete(pdfViewController);
                            },
                            // onPageChanged: (int? page, int? total) {
                            //   print('page change: $page/$total');
                            // },
                            // onPageError: (page, error) {
                            //   print('$page: ${error.toString()}');
                            // },
                          );
                        } else {
                          // ...
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    child: const Text('Télécharger le  PDF'),
                    onPressed: () async {
                      File actualFile = await PdfCreator.generate(testW);
                      final directory = await getExternalStorageDirectory();
                      final filePath =
                          '${directory!.path}/${DateTime.now().microsecondsSinceEpoch}.pdf';
                      final filee = File(filePath);
                      filee.writeAsBytes(actualFile.readAsBytesSync());
                      await OpenFile.open(filePath);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
