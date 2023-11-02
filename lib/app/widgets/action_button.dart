import 'package:flutter/material.dart';
import 'package:locapay/app/core/utils/extensions.dart';

//stateless widget
class ActionButton extends StatelessWidget {
  final String? action;
  final VoidCallback? onPressed;
  //constructor
  const ActionButton({Key? key, required this.action, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //button container
      height: 5.0.hp,
      width: 90.0.wp,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      //button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00DBB7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          action!,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Imprima',
              fontSize: 2.0.hp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
