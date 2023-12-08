import 'package:flutter/material.dart';

class OwnerLocationItem extends StatelessWidget {
  //add required title, icon and body
  final String? title;
  final String? id;
  final int? nbRooms;
  final int? nbLivingRooms;
  final String? occupant;
  final String? occupationStartDate;
  final double? amount;
  final String? nextPaymentDate;
  final bool? isOccuped;

  const OwnerLocationItem({
    super.key,
    required this.title,
    required this.id,
    required this.nbRooms,
    required this.nbLivingRooms,
    required this.occupant,
    this.occupationStartDate,
    required this.amount,
    this.nextPaymentDate,
    required this.isOccuped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: isOccuped!
            ? MediaQuery.of(context).size.height * 0.426
            : MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border(
            left: BorderSide(color: Colors.black.withOpacity(0.5)),
            top: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.5),
            ),
            right: BorderSide(color: Colors.black.withOpacity(0.5)),
            bottom: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 11.60,
              offset: Offset(1, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  id!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF00DAB7),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 75,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.30,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              nbLivingRooms.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF00DAB7),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Chambres',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              nbRooms.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF00DAB7),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Salon.s',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Occupant',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 5),
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/occupants.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        isOccuped! ? occupant! : "Aucun",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF00DAB7),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (isOccuped!)
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.30,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            if (isOccuped!) const SizedBox(height: 10),
            if (isOccuped!)
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/icons/startDate.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Date d’Emménagement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    occupationStartDate!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF00DAB7),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.30,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/income.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Loyer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '${amount!} FCFA / mois',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF00DAB7),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            if (isOccuped!) const SizedBox(height: 10),
            if (isOccuped!)
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.30,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            if (isOccuped!) const SizedBox(height: 10),
            if (isOccuped!)
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Prochain Virement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    nextPaymentDate!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF00DAB7),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
