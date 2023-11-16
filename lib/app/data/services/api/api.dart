import 'dart:convert';

import 'package:dio/dio.dart';

class AuthService {
  //add required filePath

  Future login(String phone, String password) async {
    final dio = Dio();
    const url = "https://locapay.lazonebleue.com/api/login";
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
      ..add(MapEntry('role_id', roleId))
      ..add(MapEntry('activity_id', activityId))
      ..add(MapEntry('city_id', cityId));

    filePath != ""
        ? formData.files.add(
            MapEntry(
              'image',
              await MultipartFile.fromFile(filePath, filename: 'upload.jpg'),
            ),
          )
        : null;

    try {
      final response = await dio.post(
        'https://locapay.lazonebleue.com/api/register',
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "application/json",
          },
        ),
      );
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
}
