import 'package:flutter/material.dart';

class AccountType extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;
  final String? body;
  final bool isSelected;
  const AccountType({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.body,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.all(15),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                            iconUrl!), // replace with your image path
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 180,
            child: Text(
              body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
