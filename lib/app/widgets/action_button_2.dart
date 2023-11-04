import 'package:flutter/material.dart';
import 'package:locapay/app/core/utils/extensions.dart';

//stateless widget
class ActionButton2 extends StatelessWidget {
  final String? action;
  final VoidCallback? onPressed;
  //final IconData? icon;
  //constructor
  const ActionButton2({
    Key? key,
    required this.action,
    required this.onPressed,
    /*required this.icon*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //button container
      height: 5.0.hp,
      width: 70.0.wp,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/icons/home_search.png"), // replace with your image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              action!,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Imprima',
                  fontSize: 2.0.hp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
