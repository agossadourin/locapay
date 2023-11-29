import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/controllers/principal_controller.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/widgets/drawer_element.dart';
import 'package:locapay/app/modules/principal/widgets/wallet_widget.dart';

import '../../register/controllers/file_controller.dart';
import '../../register/register_page.dart';

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
                        Get.find<UserController>()
                                    .userData
                                    .value!
                                    .imgUrl
                                    ?.isNotEmpty ??
                                false
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                            const SizedBox(height: 5),
                            const Text(
                              'Calavi - Zoca',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const WalletWidget(),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 0;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/dashboard.png',
              title: 'Tableau de bord',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 1;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/account.png',
              title: 'Modifier mon profil',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 2;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/my_locations.png',
              title: 'Location.s',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 3;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/terms_and_conditions.png',
              title: 'Règlement et Contrat.s',
            ),
            DrawerElement(
              onTap: () {
                Get.find<PrincipalController>().currentPage.value = 4;
                Get.back();
                //close the drawer
              },
              icon: 'assets/icons/faq.png',
              title: 'A propos de Locapay',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color(0xFF00DAB7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const RegisterPage());
                          },
                          child: SizedBox(
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
                                            "assets/icons/logout.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Se déconnecter',
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
                  ),
                  const Text(
                    'Copyright © LocaPay 2023 ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF00DAB7),
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
