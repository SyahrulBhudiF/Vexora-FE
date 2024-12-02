import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/History/history_model.dart';
import 'package:vexora_fe/data/models/Music/music_model.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';

class HistoryController {
  final Logger _logger = Logger('HistoryController');
  static const String _baseUrl = 'http://192.168.245.249:5555/api/v1';

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
}
