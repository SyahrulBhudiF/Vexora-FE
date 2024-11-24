import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:vexora_fe/data/models/History/history_model.dart';
class HistoryController {
  final Logger _logger = Logger('HistoryController');
  static const String _baseUrl = 'http://192.168.1.39:5555/api/v1';
  
  Future<Either<String, History>> getHistory() async {
    try {
      _logger.info('getHistory');
      final url = Uri.parse('$_baseUrl/history');
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Right(History.fromJson(jsonDecode(response.body)['data']));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }
}