import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  final String? title;
  final String? icon;
  final VoidCallback? onTap;
  const DrawerElement(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: MediaQuery.of(context).size.height * 0.022,
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
        child: SizedBox(
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    title!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
