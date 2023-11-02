import 'package:flutter/material.dart';
import 'package:locapay/app/widgets/action_button.dart';
import 'package:locapay/app/widgets/my_form_field.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? lastNameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? confirmPasswordController =
      TextEditingController();

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
                  const SizedBox(height: 20),
                  Image.asset('assets/images/add_photo.png'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyFormField(
                          controller: firstNameController,
                          testInputType: TextInputType.text,
                          hintText: 'Nom',
                          width: MediaQuery.of(context).size.width * 0.375,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrez votre nom';
                            }
                            return null;
                          }),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005),
                      MyFormField(
                          controller: lastNameController,
                          testInputType: TextInputType.text,
                          hintText: 'Prénom',
                          width: MediaQuery.of(context).size.width * 0.375,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrez votre prénom';
                            }
                            return null;
                          }),
                    ],
                  ),
                  const SizedBox(height: 15),
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
                  MyFormField(
                      controller: confirmPasswordController,
                      testInputType: TextInputType.text,
                      hintText: 'Confirmer le mot de passe',
                      width: MediaQuery.of(context).size.width * 0.9,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
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
                      onPressed: () {
                        // Add an onPressed parameter to handle the button press
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // TODO: Implement registration logic
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
