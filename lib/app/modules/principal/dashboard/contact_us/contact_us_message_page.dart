import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/widgets/action_button_2.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

class ContactUsMessagePage extends StatelessWidget {
  final int? messageType;
  final String? title;
  ContactUsMessagePage({super.key, required this.messageType, this.title});

  TextEditingController formController = TextEditingController();
  final List<String> texts = [
    'Veillez à bien détailler votre rapport afin que nous vous comprenions bien.',
    'Veillez à bien détailler votre rapport afin que nous vous comprenions bien.',
    '',
    'N\'hésitez pas dans vos Suggestion'
  ];

  @override
  Widget build(BuildContext context) {
    //onPress function
    void onPressed() {
      Get.defaultDialog(
        radius: 10,
        titlePadding: const EdgeInsets.all(20),
        title: 'Merci pour votre message',
        titleStyle: const TextStyle(
          color: Color(0xFF00DAB7),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
        content: const Text(
          'Nous vous reviendrons sous peu',
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
            Get.to(() => const Principal());
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
                  'ok',
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
              title: Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                    if (messageType == 0)
                      MyFormField(
                          leftIcon: 'assets/icons/user.png',
                          controller: formController,
                          testInputType: TextInputType.text,
                          hintText: 'Nom du propriétaire',
                          width: MediaQuery.of(context).size.width * 0.8,
                          hasSepBar: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enrez le nom!';
                            }
                            return null;
                          }),
                    if (messageType == 1)
                      MyFormField(
                          leftIcon: 'assets/icons/user.png',
                          controller: formController,
                          testInputType: TextInputType.text,
                          hintText: 'Nom de l\'artisan',
                          width: MediaQuery.of(context).size.width * 0.8,
                          hasSepBar: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enrez le nom!';
                            }
                            return null;
                          }),
                    if (messageType == 2)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Détaillez correctement votre plainte et si possible, renseignez les noms des intéressés.\n\nS’il s’agit d’un problème à notre niveau également (bugs de l’applications, etc) faites le nous savoir également. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF0202),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    if (messageType == 3)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          'Ecrivez vos suggestion',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF00DAB7),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    if (messageType == 1)
                      MyFormField(
                          leftIcon: 'assets/icons/star.png',
                          controller: formController,
                          testInputType: TextInputType.number,
                          hintText: 'Notez l\'artisan sur 10',
                          width: MediaQuery.of(context).size.width * 0.8,
                          hasSepBar: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrez une note!';
                            }
                            return null;
                          }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Text(
                        texts[messageType!],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: 150,
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    if (messageType != 2)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: ActionButton2(
                          action: "Envoyer le message",
                          onPressed: onPressed,
                          icon: "assets/icons/send.png",
                        ),
                      ),

                    if (messageType == 2)
                      GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFF0202),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/sad_white.png"),
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
                                'Envoyer la plainte',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    //suit
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
