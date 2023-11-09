import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/contracts/widgets/article.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: 21,
                      height: 21,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/info.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        'Termes du contrat engager par Mr ADJIBI pour la location de sa maison.    Veuillez en prendre connaissance, le signé et payé l’acompte pour entrer en possession de la location.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      'Articles du Contrat',
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
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),

                    //continue here
                    const Article(
                      id: 1,
                      title: 'objet',
                      isImportant: false,
                      content:
                          'Le bailleur donne en location au locataire, qui accepte, le bien immobilier situé au [14,Rue de la Haie-Vive, Cotonou]',
                    ),
                    const Article(
                      id: 2,
                      title: 'Durée',
                      isImportant: false,
                      content:
                          'Le bail est conclu pour une durée indéterminée, à compter du [22 Juin 2023]',
                    ),
                    const Article(
                      id: 3,
                      title: 'Loyer et Charges',
                      isImportant: false,
                      content:
                          'Le loyer mensuel est fixé à [47 500] franc cfa, payable de manière fractionnée entre le 20 et le 1er de chaque mois',
                    ),
                    const Article(
                      id: 4,
                      title: 'Dépôt de garantie',
                      isImportant: true,
                      content:
                          'Le locataire verse un dépôt de garantie de [95 000] FCFA au bailleur, à la signature du présent contrat. Ce dépôt de garantie sera restitué au locataire au plus tard dans les trois jours suivant l’annulation d’un contrat dans les moins de 2 mois, déduction faite des sommes éventuellement dues au bailleur au titre des réparations locatives ou des impayés de loyer.',
                    ),
                    const Article(
                      id: 5,
                      title: 'Durée',
                      isImportant: false,
                      content:
                          'Le bailleur est tenu de remettre au locataire le bien loué en bon état d\'usage et de réparation. Il est également tenu de garantir au locataire la jouissance paisible du bien.',
                    ),
                    const Article(
                      id: 6,
                      title: 'Durée',
                      isImportant: false,
                      content:
                          'Le bailleur est tenu de remettre au locataire le bien loué en bon état d\'usage et de réparation. Il est également tenu de garantir au locataire la jouissance paisible du bien.',
                    ),
                    const Article(
                      id: 7,
                      title: 'Durée',
                      isImportant: false,
                      content:
                          'Le bailleur est tenu de remettre au locataire le bien loué en bon état d\'usage et de réparation. Il est également tenu de garantir au locataire la jouissance paisible du bien.',
                    ),
                    const Article(
                      id: 8,
                      title: 'Durée',
                      isImportant: false,
                      content:
                          'Le bailleur est tenu de remettre au locataire le bien loué en bon état d\'usage et de réparation. Il est également tenu de garantir au locataire la jouissance paisible du bien.',
                    ),
                    const Article(
                      id: 9,
                      title: 'Durée',
                      isImportant: true,
                      content:
                          'Le bailleur est tenu de remettre au locataire le bien loué en bon état d\'usage et de réparation. Il est également tenu de garantir au locataire la jouissance paisible du bien.',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      'Fait à Cotonou le 18 Juin 2023',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: 310,
                      height: 41,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 8),
                      decoration: const BoxDecoration(color: Color(0xFF00DAB7)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/validate.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Signer et Payer l’acompte',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: 310,
                      height: 41,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 8),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF0202),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/reject_contract.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Rejeter le contrat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
