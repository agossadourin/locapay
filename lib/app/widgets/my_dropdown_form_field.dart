import 'package:flutter/material.dart';
import 'package:locapay/app/core/utils/extensions.dart';

class MyDropdownFormField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String?) onChanged;
  final double? width;
  final String? leftIcon;
  final String? rightIcon;

  const MyDropdownFormField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.width,
    required this.rightIcon,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.hp,
      width: width,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          width: 1.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
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
          SizedBox(
            height: 5.5.hp,
            width: width,
            child: DropdownButtonFormField<String>(
              icon: Image.asset(rightIcon!),
              decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.only(left: 30, bottom: 5, right: 15),
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
