import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/data/models/location_model.dart';

// ignore: must_be_immutable
class PictureViewer extends StatelessWidget {
  final Location? location;
  PictureViewer({super.key, required this.location});

  RxString curentImage = ''.obs;
  RxInt curentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.38,
      padding: const EdgeInsets.all(14.07),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.30000001192092896),
          ),
          borderRadius: BorderRadius.circular(14.07),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 14.07,
            offset: Offset(0, 5.63),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(curentImage.isNotEmpty
                      ? curentImage.value
                      : location!.mainImageUrl),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.11),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: location!.gallery.asMap().entries.map((entry) {
                    int index = entry.key;
                    var image = entry.value;
                    return Opacity(
                      opacity: curentIndex.value == index ? 1 : 0.25,
                      child: GestureDetector(
                        onTap: () {
                          curentImage.value = image.imageUrl;
                          curentIndex.value = index;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.height * 0.07,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image.imageUrl),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
