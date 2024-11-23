import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController {
  final Logger _logger = Logger('ChangePasswordController');
  static const String _baseUrl = 'http://192.168.64.88:5555/api/v1';

  Future<Either<String, String>> changePassword(ChangePasswordDto request) async {
    try {
      _logger.info('changePassword');
      final url = Uri.parse('$_baseUrl/password');
      
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      if (authData == null) {
        return const Left('No authentication data found.');
      }
      final accessToken = jsonDecode(authData)['access_token'];

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          return Right(data['message']);
        } else {
          return Left(data['message']);
        }
      } else {
        final data = jsonDecode(response.body);
        return Left(data['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left('Failed to change password: $e');
    }
  }
}
