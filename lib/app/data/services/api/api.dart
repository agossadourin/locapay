import 'package:dio/dio.dart';

class AuthService {
  //add required filePath

  final Dio _dio = Dio();

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://laravel.lazonebleue.com/api/login',
        data: {
          'email': email,
          'password': password,
        },
        // header
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      final token = response.data['message'];
      if (token != null) {
        print('ok' + token);
        return token;
      } else {
        throw Exception('Token is null');
      }
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
    }
  }

  Future<void> register(String filePath) async {
    var dio = Dio();

    final formData = FormData();

    formData.fields
      ..add(const MapEntry('lastname', 'non'))
      ..add(const MapEntry('firstname', 'veliit'))
      ..add(const MapEntry('password', 'password123'))
      ..add(const MapEntry('password_confirmation', 'password123'))
      ..add(const MapEntry('email', '4@example.net'))
      ..add(const MapEntry('phone', '00000005'))
      ..add(const MapEntry('npi', '0000000005'))
      ..add(const MapEntry('sexe', '1'))
      ..add(const MapEntry('role_id', '1'))
      ..add(const MapEntry('activity_id', '1'))
      ..add(const MapEntry('city_id', '1'));

    formData.files.add(
      MapEntry(
        'image',
        await MultipartFile.fromFile(filePath, filename: 'upload.jpg'),
      ),
    );

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
    }
  }
}
