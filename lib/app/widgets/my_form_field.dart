import 'package:flutter/material.dart';
import 'package:locapay/app/core/utils/extensions.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? testInputType;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? width;
  const MyFormField(
      {Key? key,
      required this.controller,
      required this.testInputType,
      required this.hintText,
      required this.validator,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.hp,
      width: width,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          width: 1.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: testInputType,
        validator: validator,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 20, bottom: 5),
            hintText: hintText,
            hintStyle: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 0.25),
                fontFamily: 'Imprima',
                fontSize: 2.0.hp,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
