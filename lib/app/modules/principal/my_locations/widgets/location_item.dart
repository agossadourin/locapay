import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? iconUrl;
  final bool isSelected;

  const LocationItem({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.width * 0.45,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 37.42,
                  height: 37.42,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 37.42,
                          height: 37.42,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(iconUrl!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 9.36),
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF00DAB7)
                        : const Color(0xFF202020),
                    fontSize: 12.16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 9.36),
                Container(
                  width: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 9.36),
                const Text(
                  '5 mois de location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 9.36),
                const Text(
                  'Cotonou - Haie Vive',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
