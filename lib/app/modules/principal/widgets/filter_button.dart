import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String? text;
  final String? icon;
  const FilterButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 25,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11.59,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(width: 7.73),
          SizedBox(
            width: 15,
            height: 15,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 15,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(-1.57),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(icon!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
