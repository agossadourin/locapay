import 'package:dio/dio.dart';

class AuthService {
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
      throw Exception('Failed to log in: $e');
      //adilan2403@gmail.com
    }
  }
}
