import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  final String? title;
  final String? body;
  final String? icon;
  final VoidCallback? onTap;
  const DrawerElement(
      {super.key,
      required this.title,
      required this.body,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 310,
        height: 71,
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0x0200DAB7),
          border: Border(
            left: BorderSide(
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            top: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            right: BorderSide(
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            bottom: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    icon!), // replace with your image path
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              body!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
