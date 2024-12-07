import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/History/history_model.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';

class HistoryController {
  final Logger _logger = Logger('HistoryController');
  static const String _baseUrl = 'http://103.181.183.212:5555/api/v1';

  Future<Either<String, List<History>>> getHistory() async {
    try {
      _logger.info('getHistory');
      final url = Uri.parse('$_baseUrl/history');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        final data = List<Map<String, dynamic>>.from(parsed['data']);
        final histories = data.map((json) => History.fromJson(json)).toList();
        return Right(histories);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Track>>> getMusicHistory(String musicId) async {
    try {
      _logger.info('getHistory');
      final url = Uri.parse('$_baseUrl/music/$musicId');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
      );
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        final data = List<Map<String, dynamic>>.from(parsed['data']);
        final music = data.map((json) => Track.fromJson(json)).toList();
        return Right(music);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getMostMood(String userId) async {
    try {
      final url = Uri.parse('$_baseUrl/history/most-mood?user_id=$userId');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');

      if (authData == null) {
        return Left('Auth data not found');
      }

      final accessToken = jsonDecode(authData)['access_token'];

      if (accessToken == null) {
        return Left('Access token not found');
      }

      // Log the request details
      print('Fetching most mood for user: $userId');
      print('Request URL: $url');
      print('Access Token: $accessToken');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
      );

      // Log the response details
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);

        if (parsed['success']) {
          final mood = parsed['data']['mood'];
          print('Most mood: $mood');
          return Right(mood);
        } else {
          final message = parsed['message'] ?? 'Unknown error';
          return Left(message);
        }
      } else {
        final errorResponse = jsonDecode(response.body);
        final message = errorResponse['message'] ?? 'Unknown error';
        return Left(message);
      }
    } catch (e) {
      print('Error: $e');
      return Left(e.toString());
    }
  }
}
