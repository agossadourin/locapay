import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Image.asset(
            'assets/images/logo_black.png',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'LocaPay',
                    style: TextStyle(
                      color: Color(0xFF00DAB7),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' est une startup qui propose une solution de location simple et sécurisée.\n\nNotre application permet aux propriétaires de mettre en location leur.s bien.s en quelques clics, et aux locataires de non seulement trouver la maison qui leur convient mais également de pouvoir contacter des artisans proches, disponibles et certifiés pour gérer leurs travaux et d’autres prestations à domicile en toute confiance.',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              'Contactez-nous via les réseaux',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.30,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //////////////////////////////////////////////////////////
          SizedBox(
            width: 252,
            height: 74,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16.26,
                      height: 16.26,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 16.26,
                              height: 16.26,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/whatsapp_green.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4.06),
                    const Text(
                      '00229 66 00 00 66',
                      style: TextStyle(
                        color: Color(0xFF00DAB7),
                        fontSize: 14.63,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  width: 81.29,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.24,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF00DAB7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'support@locapay.com',
                  style: TextStyle(
                    color: Color(0xFF00DAB7),
                    fontSize: 14.63,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 81.29,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.24,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF00DAB7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 43.08),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '@locapay',
                        style: TextStyle(
                          color: Color(0xFF00DAB7),
                          fontSize: 14.63,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 4.06),
                      SizedBox(
                        width: 107.30,
                        height: 16.84,
                        child: Stack(
                          children: [
                            Container(
                              width: 177.32,
                              height: 24.73,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/social_medias.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          /////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
