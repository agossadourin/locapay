import 'package:flutter/material.dart';
import 'package:locapay/app/core/utils/extensions.dart';

class MyDropdownFormField2 extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String?) onChanged;
  final double? width;
  final String? leftIcon;
  final String? rightIcon;
  final bool? hasSepBar;

  const MyDropdownFormField2({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.width,
    required this.rightIcon,
    required this.hasSepBar,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.hp,
      width: width!,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.25),
          width: 1.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          if (leftIcon != null)
            Positioned(
              left: 0,
              top: 1.125.hp,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(leftIcon!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          if (hasSepBar!)
            Positioned(
              left: 3.5.hp,
              top: 1.125.hp,
              child: Container(
                width: 1,
                height: 3.0.hp,
                color: const Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ),
          SizedBox(
            height: 5.5.hp,
            width: width!,
            child: DropdownButtonFormField<String>(
              icon: Image.asset(rightIcon!),
              decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: hasSepBar! ? 40 : 30, bottom: 5, right: 15),
                  hintStyle: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.25),
                      fontFamily: 'Imprima',
                      fontSize: 2.0.hp,
                      fontWeight: FontWeight.w400)),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Imprima',
                            fontSize: 2.0.hp,
                            fontWeight: FontWeight.w400)));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
