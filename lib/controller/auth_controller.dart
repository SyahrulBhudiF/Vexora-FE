import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/core/utils/http/http_client.dart';
import 'package:vexora_fe/core/utils/storage/local_storage.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/data/models/dto/Request/register_dto.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final Logger _logger = Logger('AuthController');
  static const String _baseUrl = 'http://192.168.64.88:5555/api/v1';

  Future<Either<String, User>> register(RegisterDto request) async {
    try {
      _logger.info('register');
      final url = Uri.parse('$_baseUrl/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );
      // .timeout(const Duration(seconds: 15)); // Adding a timeout

      // print(response.statusCode);
      // print(response.body);
      // _logger.info('Response status: ${response.statusCode}');
      // _logger.info('Response body: ${response.body}');

      // print(User.fromJson(jsonDecode(response.body)['data']));

      if (response.statusCode == 200) {
        return Right(User.fromJson(jsonDecode(response.body)['data']));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }

  Future<Either<String, User>> login(LoginDto request) async {
    try {
      _logger.info('login');
      final url = Uri.parse('$_baseUrl/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      // final response = await VexoraHttpClient.post('login', request.toJson());
      if (response.statusCode == 200) {
        final accessToken = jsonDecode(response.body)['data']['access_token'];
        final refreshToken = jsonDecode(response.body)['data']['refresh_token'];
        print(accessToken);
        // Decode the access token
        Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
        _logger.info("Decoded Token: $decodedToken");
        // Extract user information from the decoded token
        final user = User(
          uuid: decodedToken['uuid'],
          username: decodedToken['username'],
        );

        print(user.toJson());

        // await VexoraLocalStorage().saveData('access_token', accessToken);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'auth_data',
            jsonEncode({
              'access_token': accessToken,
              'refresh_token': refreshToken,
            }));
        return Right(user);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Failed to login user: $e");
      return Left('Failed to login user: $e');
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      _logger.info('logout');
      final url = Uri.parse('$_baseUrl/logout');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final refreshToken = jsonDecode(authData!)['refresh_token'];
      final accessToken = jsonDecode(authData)['access_token'];

      print(refreshToken);
      print(accessToken);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
        body: jsonEncode(
          {"refresh_token": refreshToken},
        ),
      );

      print(response.body);
      print(response.statusCode);
      print(jsonDecode(response.body)['message']);

      // final response = await VexoraHttpClient.post('login', request.toJson());
      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body)['message']);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Failed to login user: $e");
      return Left('Failed to login user: $e');
    }
  }
}
