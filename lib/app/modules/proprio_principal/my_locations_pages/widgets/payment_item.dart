import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentItem extends StatelessWidget {
  String? title;
  String? worker;
  String? job;
  String? date;
  double? penalty;
  PaymentItem(
      {super.key,
      required this.title,
      required this.worker,
      required this.job,
      required this.date,
      required this.penalty});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 13.13, vertical: 9.85),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.33,
              color: penalty! > 0
                  ? const Color(0xFFFF0202)
                  : const Color(0xFF00DAB7)),
          borderRadius: BorderRadius.circular(3.28),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 5.91,
            offset: Offset(0, 1.31),
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
            'Facture N° ${title!}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF303030),
              fontSize: 9.85,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 6.56),
          SizedBox(
            width: 19.69,
            height: 19.69,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 19.69,
                    height: 19.69,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: penalty! > 0
                            ? const AssetImage("assets/icons/red_invoice.png")
                            : const AssetImage(
                                "assets/icons/green_invoice.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.56),
          Text(
            worker!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF303030),
              fontSize: 9.85,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 6.56),
          Container(
            width: 32.82,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.33,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6.56),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                job!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF303030),
                  fontSize: 9.85,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(height: 3.28),
              Text(
                date!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF303030),
                  fontSize: 7.88,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6.56),
          if (penalty! > 0)
            Container(
              width: 32.82,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.33,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),
              ),
            ),
          if (penalty! > 0) const SizedBox(height: 6.56),
          if (penalty! > 0)
            Text(
              '+${penalty!}% de pénalité',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFF0202),
                fontSize: 9.85,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
        ],
      ),
    );
  }
}
