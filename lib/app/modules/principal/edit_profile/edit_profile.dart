import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/controllers/principal_controller.dart';
import 'package:locapay/app/modules/register/controllers/account_type_controller.dart';
import 'package:locapay/app/modules/register/widgets/add_profile_photo.dart';
import 'package:locapay/app/widgets/my_dropdown_form_field.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? lastNameController = TextEditingController();
  final TextEditingController? sexController = TextEditingController();
  final TextEditingController? npiController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? fpasswordController = TextEditingController();
  final TextEditingController? newPasswordController = TextEditingController();
  final TextEditingController? confirmPasswordController =
      TextEditingController();
  String sexe = '';
  customGetDialog() {
    Get.defaultDialog(
      radius: 10,
      titlePadding: const EdgeInsets.all(20),
      title: 'Êtes vous sûr de vouloir sauvegarder ?',
      titleStyle: const TextStyle(
        color: Color(0xFFFF0202),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
      content: const Text(
        'Non encore operationnel.',
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
          Get.find<PrincipalController>().currentPage.value = 0;
          Get.back();
        },
        child: Container(
          width: 103,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: ShapeDecoration(
            color: const Color(0xFFFF0202),
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
                'Sauvegarder',
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
      cancel: GestureDetector(
        onTap: () {
          //close dialog
          Get.back();
        },
        child: Container(
          width: 121,
          height: 35,
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
                'Non, Retour',
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Ici, vous ne pouvez modifier que votre photo de profil et votre mot de psse',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF00DAB7),
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
              width: MediaQuery.of(context).size.width * 0.8,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AddProfilePhoto(),
                // Image.asset('assets/images/add_photo.png',
                //     width: MediaQuery.of(context).size.width * 0.23),
                const SizedBox(height: 1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyFormField(
                          leftIcon: 'assets/icons/user.png',
                          controller: firstNameController,
                          testInputType: TextInputType.text,
                          hintText: 'Nom',
                          width: MediaQuery.of(context).size.width * 0.45,
                          hasSepBar: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrez votre nom';
                            }
                            return null;
                          }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.51),
                      MyFormField(
                          leftIcon: 'assets/icons/user.png',
                          controller: lastNameController,
                          testInputType: TextInputType.text,
                          hintText: 'Prénom.s',
                          width: MediaQuery.of(context).size.width * 0.45,
                          hasSepBar: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrez votre prénom';
                            }
                            return null;
                          }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.51),
                      MyDropdownFormField(
                        leftIcon: 'assets/icons/Gender.png',
                        rightIcon: 'assets/icons/arrow_down.png',
                        hintText: 'Sexe',
                        hasSepBar: false,
                        items: const ['M', 'F'],
                        width: MediaQuery.of(context).size.width * 0.45,
                        onChanged: (String? value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            MyFormField(
                leftIcon: 'assets/icons/phone.png',
                controller: phoneController,
                testInputType: TextInputType.text,
                hintText: 'Téléphone',
                width: MediaQuery.of(context).size.width * 0.9,
                hasSepBar: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                }),
            const SizedBox(height: 15),
            MyFormField(
                leftIcon: 'assets/icons/npi.png',
                controller: npiController,
                testInputType: TextInputType.text,
                hintText: 'NPI',
                width: MediaQuery.of(context).size.width * 0.9,
                hasSepBar: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your NPI';
                  }
                  return null;
                }),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
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
            const SizedBox(height: 15),
            GestureDetector(
              onTap: customGetDialog,
              child: Container(
                width: 280,
                height: 41,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF00DAB7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
                                  image: AssetImage("assets/icons/save.png"),
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
                      'Enregistrer les modifications',
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
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
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
            const SizedBox(height: 15),
            const Text(
              'Changer mon Mot de Passe',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
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
            const SizedBox(height: 15),
            Obx(
              () => MyFormField(
                  leftIcon: 'assets/icons/lock.png',
                  rightIcon:
                      Get.find<AccountTypeController>().hidePassword.value ==
                              false
                          ? 'assets/icons/show.png'
                          : 'assets/icons/hide.png',
                  onTap: () {
                    if (Get.find<AccountTypeController>().hidePassword.value ==
                        true) {
                      Get.find<AccountTypeController>().hidePassword.value =
                          false;
                    } else {
                      Get.find<AccountTypeController>().hidePassword.value =
                          true;
                    }
                  },
                  obscureText:
                      Get.find<AccountTypeController>().hidePassword.value,
                  controller: fpasswordController,
                  testInputType: TextInputType.text,
                  hintText: 'Mot de passe',
                  width: MediaQuery.of(context).size.width * 0.9,
                  hasSepBar: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
            ),
            const SizedBox(height: 15),
            Obx(
              () => MyFormField(
                  leftIcon: 'assets/icons/lock.png',
                  rightIcon:
                      Get.find<AccountTypeController>().hidePassword.value ==
                              false
                          ? 'assets/icons/show.png'
                          : 'assets/icons/hide.png',
                  onTap: () {
                    if (Get.find<AccountTypeController>().hidePassword.value ==
                        true) {
                      Get.find<AccountTypeController>().hidePassword.value =
                          false;
                    } else {
                      Get.find<AccountTypeController>().hidePassword.value =
                          true;
                    }
                  },
                  obscureText:
                      Get.find<AccountTypeController>().hidePassword.value,
                  controller: newPasswordController,
                  testInputType: TextInputType.text,
                  hintText: 'Mot de passe',
                  width: MediaQuery.of(context).size.width * 0.9,
                  hasSepBar: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
            ),
            const SizedBox(height: 15),
            Obx(
              () => MyFormField(
                  leftIcon: 'assets/icons/lock.png',
                  rightIcon:
                      Get.find<AccountTypeController>().hidePassword.value ==
                              false
                          ? 'assets/icons/show.png'
                          : 'assets/icons/hide.png',
                  onTap: () {
                    if (Get.find<AccountTypeController>().hidePassword.value ==
                        true) {
                      Get.find<AccountTypeController>().hidePassword.value =
                          false;
                    } else {
                      Get.find<AccountTypeController>().hidePassword.value =
                          true;
                    }
                  },
                  obscureText:
                      Get.find<AccountTypeController>().hidePassword.value,
                  controller: confirmPasswordController,
                  testInputType: TextInputType.text,
                  hintText: 'Mot de passe',
                  width: MediaQuery.of(context).size.width * 0.9,
                  hasSepBar: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
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
            const SizedBox(height: 15),
            GestureDetector(
              onTap: customGetDialog,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 33,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF00DAB7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Changer',
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
