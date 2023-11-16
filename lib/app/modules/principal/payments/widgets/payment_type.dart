import 'package:flutter/material.dart';

class PaymentType extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;

  final bool isSelected;
  const PaymentType({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.08,
          padding: const EdgeInsets.all(4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 0.50,
                  color: isSelected ? const Color(0xFF00DAB7) : Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 14,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(iconUrl!), // replace with your image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
