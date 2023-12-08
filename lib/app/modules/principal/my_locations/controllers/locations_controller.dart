import 'package:get/get.dart';
import 'package:locapay/app/data/models/location_model.dart';

class LocationsController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList<Location> locations = RxList<Location>();
  RxString qrDATA = ''.obs;
}
