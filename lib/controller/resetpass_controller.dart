import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import '../data/models/dto/Request/resetpass_dto.dart';

class ResetPasswordController {
  final Logger _logger = Logger('ResetPasswordController');

  static const String _baseUrl = 'https://vexora.gjdev.tech/api/v1';

  Future<Either<String, String>> resetPassword(ResetPasswordDto request) async {
    try {
      _logger.info('resetPassword');
      final url = Uri.parse('$_baseUrl/reset-password');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
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
            : 'Failed to reset password. Server returned status code ${response.statusCode}.');
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left('Failed to reset password: $e');
    }
  }
}
