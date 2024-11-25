import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController {
  final Logger _logger = Logger('ChangePasswordController');
  static const String _baseUrl = 'http://192.168.63.177:5555/api/v1';

  Future<Either<String, String>> changePassword(
      ChangePasswordDto request) async {
    try {
      _logger.info('changePassword');
      final url = Uri.parse('$_baseUrl/user/change-password');

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

      _logger.info('Response status: ${response.statusCode}');
      _logger.info('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data =
            response.body.isNotEmpty ? jsonDecode(response.body) : null;
        if (data != null && data['success'] == true) {
          return Right(data['message']);
        } else {
          return Left(
              data != null ? data['message'] : 'Unexpected error occurred.');
        }
      } else {
        final data =
            response.body.isNotEmpty ? jsonDecode(response.body) : null;
        return Left(data != null
            ? data['message']
            : 'Failed to change password. Server returned status code ${response.statusCode}.');
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left('Failed to change password: $e');
    }
  }
}
