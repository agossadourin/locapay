import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:locapay/app/data/models/location_model.dart';
import 'package:locapay/app/modules/principal/my_locations/widgets/location_item.dart';

class AuthService {
  //add required filePath
  static const baseUrl = "http://locapay.sc1cjlx6136.universe.wf/api";

  Future login(String phone, String password) async {
    final dio = Dio();
    const url = "$baseUrl/login";
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    final body = {"phone": phone, "password": password};

    try {
      final response = await dio.post(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: headers,
        ),
      );
      if (response.data["success"] == false) {
        return Exception(response.data["message"]);
      }

      return response.data['body'];
      // final token = answer[1];
      // if (token != null) {
      //   print('ok' + token);
      //   return token;
      // } else {
      //   throw Exception('Token is null');
      // }
    } catch (e) {
      print('\n \n ***************************************\n \n');
      if (e is DioException) {
        print('Error message: ${e.message}');
        print('Error data: ${e.response?.data.toString()}');
      } else {
        print(e);
      }
      print('***************************************\n \n');
      // Handle dio errors
      // Handle dio errors
      throw Exception(e);
    }
  }

  Future register(
      String firstname,
      String lastname,
      String password,
      String passwordConfirmation,
      String email,
      String phone,
      String npi,
      String sexe,
      String roleId,
      String activityId,
      String cityId,
      String filePath) async {
    var dio = Dio();

    final formData = FormData();

    formData.fields
      ..add(MapEntry('lastname', lastname))
      ..add(MapEntry('firstname', firstname))
      ..add(MapEntry('password', password))
      ..add(MapEntry('password_confirmation', passwordConfirmation))
      ..add(MapEntry('email', email))
      ..add(MapEntry('phone', phone))
      ..add(MapEntry('npi', npi))
      ..add(MapEntry('sexe', sexe))
      ..add(MapEntry('role_id', roleId));

    if (activityId.isNotEmpty) {
      formData.fields.add(MapEntry('activity_id', activityId));
    }
    if (cityId.isNotEmpty) {
      formData.fields.add(MapEntry('city_id', cityId));
    }

    filePath.isNotEmpty
        ? formData.files.add(
            MapEntry(
              'image',
              await MultipartFile.fromFile(filePath, filename: 'upload.jpg'),
            ),
          )
        : null;

    try {
      final response = await dio.post(
        '$baseUrl/register',
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "application/json",
          },
        ),
      );

      print("****Artisan test******\n\n");
      print(response);
      if (response.data["success"] == false) {
        return Exception(response.data["message"]);
      }
      print(response.data);
      return response.data['body'];

      // Handle the response...
    } catch (e) {
      print('******************');
      if (e is DioException) {
        print('Error message: ${e.message}');
        print('Error data: ${e.response?.data}');
      } else {
        print(e);
      }
      print('******************');
      // Handle dio errors
      // Handle dio errors

      return e;
      // show alert dialog with the error
    }
  }

  //Deposit

  Future deposit(
    String amount,
    String payerMobileNumber,
  ) async {
    var dio = Dio();
    String reason = "Rechargement";

    try {
      final response = await dio.get(
        '$baseUrl/initiate-transaction/$amount/$payerMobileNumber/$reason',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      if (response.data["success"] == false) {
        return Exception(response.data["message"]);
      }
      return response.data['body'];
      // Handle the response...
    } catch (e) {
      // print('********DIO**********');
      // if (e is DioException) {
      //   print('Error message: ${e.message}');
      //   print('Error data: ${e.response?.data}');
      // } else {
      //   print(e);
      // }
      // print('******************');
      // // Handle dio errors
      // // Handle dio errors

      return e;
      // show alert dialog with the error
    }
  }

//add location

  Future addLocation(
    String propertyLastName,
    String propertyFirstName,
    String propertyLocation,
    String monthlyRent,
    String description,
    String ownerPhone,
    int status,
    int rating,
    int generalRating,
    int teamRating,
    int userId,
    int cityId,
    List<String> galleries,
    List<int> mainFeatures,
    List<int> secondaryFeatures,
    String authorization,
  ) async {
    final dio = Dio();

    final formData = FormData.fromMap({
      'property_last_name': propertyLastName,
      'property_first_name': propertyFirstName,
      'property_location': propertyLocation,
      'monthly_rent': monthlyRent,
      'description': description,
      'owner_phone': ownerPhone,
      'status': status,
      'rating': rating,
      'general_rating': generalRating,
      'team_rating': teamRating,
      'user_id': userId.toString(),
      'city_id': cityId.toString(),
      'main_features': mainFeatures,
      'secondary_features': secondaryFeatures,
    });

    if (galleries.isNotEmpty) {
      for (final gallery in galleries) {
        formData.files.add(MapEntry(
          'galleries[]',
          await MultipartFile.fromFile(gallery, filename: 'upload.jpg'),
        ));
      }
    }

    formData.files.add(MapEntry(
      'main_image',
      await MultipartFile.fromFile(galleries[0], filename: 'upload.jpg'),
    ));

    try {
      final response = await dio.post(
        '$baseUrl/properties',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
            'Authorization': 'Bearer $authorization',
          },
        ),
      );
      print(response);

      if (response.data["success"] == false) {
        return Exception(response.data["message"]);
      }
      return response.data['body'];
    } catch (error) {
      print('Error adding location: $error');
      return error;
    }
  }

//get user
  Future<void> getUser(
    String token,
  ) async {
    var dio = Dio();

    try {
      final response = await dio.get(
        '$baseUrl/user',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": 'Bearer $token',
          },
        ),
      );
      if (response.data["success"] == false) {
        print(response.data["message"]);
      }
      return response.data['body'];
      // Handle the response...
    } catch (e) {
      // print('********DIO**********');
      // if (e is DioException) {
      //   print('Error message: ${e.message}');
      //   print('Error data: ${e.response?.data}');
      // } else {
      //   print(e);
      // }
      // print('******************');
      // // Handle dio errors
      // // Handle dio errors

      print(e);
      // show alert dialog with the error
    }
  }

  //show all location

  Future<List<Location>> getAllLocation(String token) async {
    var dio = Dio();

    try {
      final response = await dio.get(
        '$baseUrl/properties',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": 'Bearer $token',
          },
        ),
      );
      print(response.data['body']);
      if (response.data["success"] == false) {
        print(response.data["message"]);
      }
      final locationsData = response.data['body'];

      final locations = locationsData
          .map<Location>((locationData) => Location.fromJson(locationData))
          .toList();

      return locations;
      // Handle the response...
    } catch (e) {
      // print('********DIO**********');
      // if (e is DioException) {
      //   print('Error message: ${e.message}');
      //   print('Error data: ${e.response?.data}');
      // } else {
      //   print(e);
      // }
      // print('******************');
      // // Handle dio errors
      // // Handle dio errors

      print(e);
      return [];
      // show alert dialog with the error
    }
  }
}
