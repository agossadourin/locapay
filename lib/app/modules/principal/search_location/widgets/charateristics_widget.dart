import 'package:flutter/material.dart';

class CharateristicsWidget extends StatelessWidget {
  final String? icon;
  final bool? isLeft;
  final String? text1;
  final String? text2;
  final String? text3;
  const CharateristicsWidget(
      {super.key,
      required this.icon,
      required this.isLeft,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment al =
        isLeft! ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: al,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: al,
              children: [
                Text(
                  text1!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  text2!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                Text(
                  text3!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
