import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/principal.dart';
import 'package:locapay/app/widgets/action_button.dart';
import 'package:locapay/app/widgets/my_form_field.dart';
import 'package:locapay/app/data/services/api/api.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),

                  MyFormField(
                      controller: emailController,
                      testInputType: TextInputType.text,
                      hintText: 'email',
                      width: MediaQuery.of(context).size.width * 0.9,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 15),
                  MyFormField(
                      controller: passwordController,
                      testInputType: TextInputType.text,
                      hintText: 'Mot de passe',
                      width: MediaQuery.of(context).size.width * 0.9,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
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
                      onPressed: () {
                        // Add an onPressed parameter to handle the button press
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //login
                          var ans = authService.login(
                              emailController!.text, passwordController!.text);
                          print(ans);
                          // TODO: Implement registration logic
                          Get.to(Principal());
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
