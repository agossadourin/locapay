import 'package:get/get.dart';
import 'package:locapay/app/data/models/location_model.dart';

class LocationsDataController extends GetxController {
  // Declare locationsData as an observable list
  var locationsData = <Location>[].obs;

  // Method to update locationsData
  void updateLocations(List<Location> newLocations) {
    locationsData.value = newLocations;
  }
}
