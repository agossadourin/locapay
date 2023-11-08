import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/controllers/principal_controller.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/widgets/drawer_element.dart';

import '../../register/controllers/file_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        border: Border(
          left: BorderSide(color: Colors.black.withOpacity(0.5)),
          top: BorderSide(color: Colors.black.withOpacity(0.5)),
          right: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.5),
          ),
          bottom: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 17,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              width: 310,
              height: 100,
              padding: const EdgeInsets.only(top: 25, left: 25, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Get.find<FileController>().file.value != null
                            ? Container(
                                width: 35,
                                height: 35,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                        Get.find<FileController>().file.value!),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                                size: 35,
                              ),
                        const SizedBox(width: 10),
                        Text(
                          '${Get.find<UserController>().userData.value!.firstname} ${Get.find<UserController>().userData.value!.lastname}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 0;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/account.png',
              title: 'Modifier mon profil',
              body:
                  'Modifier vos informations ou changer votre photo de profil',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 1;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/my_locations.png',
              title: 'Location.s',
              body:
                  'Voir les informations relatives à vos/votre location. ... contrat.s signés ... les arrêtés.',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 2;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/terms_and_conditions.png',
              title: 'Contrat.s',
              body:
                  'Revoir les termes et conditions de l’application pour les comptes “Locataire”.',
            ),
          ],
        ),
      ),
    );
  }
}
