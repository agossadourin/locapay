import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/notifications_page/widgets/notification_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                  'Notifications',
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
                        const NotificationItem(
                          isCertified: true,
                          isContract: true,
                          isRead: false,
                          title: 'Contrat de location',
                          duration: '15',
                          bodyText:
                              'Un contrat de location à été lancer à votre nom par le propriétaire de la maison ADJIBI avec qui vous avez échangé. Lisez les termes du contrat et valider le si possible afin de lancer la procédure de location',
                        ),
                        const NotificationItem(
                          isCertified: false,
                          isContract: false,
                          isRead: true,
                          title: 'Contrat de location',
                          duration: '15',
                          bodyText:
                              'Un contrat de location à été lancer à votre nom par le propriétaire de la maison ADJIBI avec qui vous avez échangé. Lisez les termes du contrat et valider le si possible afin de lancer la procédure de location',
                        ),
                        const NotificationItem(
                          isCertified: false,
                          isContract: false,
                          isRead: true,
                          title: 'Contrat de location',
                          duration: '15',
                          bodyText:
                              'Un contrat de location à été lancer à votre nom par le propriétaire de la maison ADJIBI avec qui vous avez échangé. Lisez les termes du contrat et valider le si possible afin de lancer la procédure de location',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Container(
                          width: 101,
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration:
                              const BoxDecoration(color: Color(0xFF00DAB7)),
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
                                                "assets/icons/delete.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Tout Effacer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
