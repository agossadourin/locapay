import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/widgets/action_button_2.dart';

class ContractRejectionPage extends StatelessWidget {
  const ContractRejectionPage({super.key});

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
              title: const Text(
                'Rejet de contrat',
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
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
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
                                          "assets/icons/decision_making.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          height: 25,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF303030),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const Text(
                            'Expliquez nous ce qui ne va pas.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: const Text(
                        'Veuillez détailler les raisons de votre rejet du contrat et si possible, poser vos attentes / revendications afin que l’on puisse vous aider.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ActionButton2(
                        action: "Envoyer le message",
                        onPressed: onPressed,
                        icon: "assets/icons/send.png",
                      ),
                    ),

                    SizedBox(
                      child: ActionButton2(
                        action: "Appeler le service Client",
                        onPressed: onPressed,
                        icon: "assets/icons/phone_call.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressed,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
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
                                              "assets/icons/cancel.png"),
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
                              'La location ne me plaît plus.',
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
