import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/dto/Request/randomRecommendations_dto.dart';

class PlaylistController {
  final Logger _logger = Logger('PlaylistController');

  static const String _baseUrl = 'http://103.181.183.212:5555/api/v1';

  Future<Either<String, List<PlaylistDto>>> getPlaylists() async {
    try {
      _logger.info('getPlaylists');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];
      final url = Uri.parse('$_baseUrl/spotify/random-playlist');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $accessToken",
      });

      if (response.statusCode == 200) {
        // Mengambil data dari key 'data' karena data playlists langsung ada di sini
        List<dynamic> data = jsonDecode(response.body)['data']['music'];
        _logger.info(
            'Data Playlist: $data'); // Debugging untuk memastikan data yang diterima
        List<PlaylistDto> playlists =
            data.map((item) => PlaylistDto.fromJson(item)).toList();
        return Right(playlists);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }
}
