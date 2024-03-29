import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/models/user.dart';
import 'package:locapay/app/modules/artisans_principal/artisans_principal.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/modules/proprio_principal/proprio_principal.dart';
import 'package:locapay/app/modules/register/controllers/account_type_controller.dart';
import 'package:locapay/app/widgets/action_button.dart';
import 'package:locapay/app/data/services/api/api.dart';
import 'package:locapay/app/widgets/my_form_field_bold.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  AuthService authService = AuthService();
  final loginInProgress = ValueNotifier<bool>(false);

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
                  const SizedBox(height: 50),

                  MyFormFieldBold(
                      leftIcon: "assets/icons/phone_bold.png",
                      controller: emailController,
                      testInputType: TextInputType.text,
                      hintText: 'téléphone',
                      width: MediaQuery.of(context).size.width * 0.9,
                      hasSepBar: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      }),
                  const SizedBox(height: 15),
                  Obx(
                    () => MyFormFieldBold(
                        leftIcon: 'assets/icons/lock_bold.png',
                        rightIcon: Get.find<AccountTypeController>()
                                    .hidePassword2
                                    .value ==
                                false
                            ? 'assets/icons/show.png'
                            : 'assets/icons/hide_bold.png',
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
                        controller: passwordController,
                        testInputType: TextInputType.visiblePassword,
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

                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      'Mot de passe oublié?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF00DAB7),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF00DAB7),
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //separator line
                  Container(
                    width: 100,
                    height: 1,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ActionButton(
                      action:
                          'Se Connecter', // Pass a string instead of a function
                      onPressed: () async {
                        // Add an onPressed parameter to handle the button press
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //login
                          setState(() {
                            loginInProgress.value = true;
                          });

                          var answer = await authService.login(
                              emailController!.text, passwordController!.text);

                          setState(() {
                            loginInProgress.value = false;
                          });
                          print(answer);
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
                            Get.find<WalletController>().balance.value =
                                double.parse(answer['balance']);
                            User user = User.fromJson(answer);
                            Get.find<UserController>().userData.value = user;
                            if (user.roleId == 1) {
                              Get.offAll(() => const ProprioPrincipal());
                            } else if (user.roleId == 3) {
                              Get.offAll(() => const ArtisansPrincipal());
                            } else {
                              Get.offAll(() => const Principal());
                            }
                          }

                          // TODO: Implement registration logic
                        }
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
