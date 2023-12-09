import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/models/user.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/modules/proprio_principal/proprio_principal.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:locapay/app/modules/register/widgets/add_profile_photo.dart';
import 'package:locapay/app/widgets/action_button.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

import '../../widgets/my_dropdown_form_field.dart';
import 'controllers/account_type_controller.dart';

class RegisterProprioWidget extends StatefulWidget {
  const RegisterProprioWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterProprioWidgetState createState() => _RegisterProprioWidgetState();
}

class _RegisterProprioWidgetState extends State<RegisterProprioWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? lastNameController = TextEditingController();
  final TextEditingController? sexController = TextEditingController();
  final TextEditingController? npiController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? confirmPasswordController =
      TextEditingController();

  String sexe = '';
  final loginInProgress = ValueNotifier<bool>(false);

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text('Compte Propriétaire',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                  Row(
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
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.51),
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
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.51),
                            MyDropdownFormField(
                              leftIcon: 'assets/icons/Gender.png',
                              rightIcon: 'assets/icons/arrow_down.png',
                              hintText: 'Sexe',
                              hasSepBar: false,
                              items: const ['M', 'F'],
                              width: MediaQuery.of(context).size.width * 0.45,
                              onChanged: (String? value) {
                                if (value == 'M') {
                                  setState(() {
                                    sexe = '1';
                                  });
                                } else {
                                  setState(() {
                                    sexe = '2';
                                  });
                                }
                              },
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
                      leftIcon: 'assets/icons/phone.png',
                      controller: emailController,
                      testInputType: TextInputType.text,
                      hintText: 'Email',
                      width: MediaQuery.of(context).size.width * 0.9,
                      hasSepBar: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
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
                    width: 100,
                    height: 1,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => MyFormField(
                        leftIcon: 'assets/icons/lock.png',
                        rightIcon: Get.find<AccountTypeController>()
                                    .hidePassword
                                    .value ==
                                false
                            ? 'assets/icons/show.png'
                            : 'assets/icons/hide.png',
                        onTap: () {
                          if (Get.find<AccountTypeController>()
                                  .hidePassword
                                  .value ==
                              true) {
                            Get.find<AccountTypeController>()
                                .hidePassword
                                .value = false;
                          } else {
                            Get.find<AccountTypeController>()
                                .hidePassword
                                .value = true;
                          }
                        },
                        obscureText: Get.find<AccountTypeController>()
                            .hidePassword
                            .value,
                        controller: passwordController,
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
                        rightIcon: Get.find<AccountTypeController>()
                                    .hidePassword2
                                    .value ==
                                false
                            ? 'assets/icons/show.png'
                            : 'assets/icons/hide.png',
                        onTap: () {
                          if (Get.find<AccountTypeController>()
                                  .hidePassword2
                                  .value ==
                              true) {
                            Get.find<AccountTypeController>()
                                .hidePassword2
                                .value = false;
                          } else {
                            Get.find<AccountTypeController>()
                                .hidePassword2
                                .value = true;
                          }
                        },
                        obscureText: Get.find<AccountTypeController>()
                            .hidePassword2
                            .value,
                        controller: confirmPasswordController,
                        testInputType: TextInputType.visiblePassword,
                        hintText: 'Confirmer le mot de...',
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
                    width: 100,
                    height: 1,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Terms et Conditions d’utilisation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ActionButton(
                      action: 'Créer', // Pass a string instead of a function
                      onPressed: () async {
                        // Add an onPressed parameter to handle the button press

                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            loginInProgress.value = true;
                          });
                          var answer = await authService.register(
                            firstNameController!.text,
                            lastNameController!.text,
                            passwordController!.text,
                            confirmPasswordController!.text,
                            emailController!.text,
                            phoneController!.text,
                            npiController!.text,
                            sexe,
                            '1',
                            '',
                            '',
                            "",
                          );
                          setState(() {
                            loginInProgress.value = false;
                          });

                          if (answer is DioException) {
                            // Handle the exception...
                            print('Error message: ${answer.message}');
                            print('Error data: ${answer.response?.data}');
                            //show alert dialog
                            Get.defaultDialog(
                              title: 'Error',
                              middleText: answer.response!.data.toString(),
                              onConfirm: () => Get
                                  .back(), // Navigate back when the confirm button is pressed
                            );
                          } else if (answer is Exception) {
                            // Handle the exception...
                            print('Error: ${answer.toString()}');
                            //show alert dialog
                            Get.defaultDialog(
                              title: 'Error',
                              middleText: answer.toString(),
                              onConfirm: () => Get
                                  .back(), // Navigate back when the confirm button is pressed
                            );
                          } else {
                            print(answer);
                            User user = User.fromJson(answer);
                            Get.find<UserController>().userData.value = user;
                            print(user.token);
                            Get.to(() => const ProprioPrincipal());
                          }
                        }
                        const CircularProgressIndicator();
                      },
                    ),
                  ),
                  loginInProgress.value
                      ? const CircularProgressIndicator()
                      : const SizedBox(),
                ],
              ),
            )),
      ),
    );
  }
}
