import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vexora_fe/data/models/dto/Request/scanFace_dto.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';

class ScanFaceController {
  final Logger _logger = Logger('ScanFaceController');
  static const String _baseUrl = 'https://vexora.gjdev.tech/api/v1';

  Future<Either<String, Data>> getScanFace(ScanFaceDto request) async {
    try {
      _logger.info('ScanFace');
      print('params');
      print(request.userId);
      print(request.faceScan!.path);
      final url = Uri.parse('$_baseUrl/mood-detection?refresh=true');

      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      if (authData == null) {
        return const Left('No authentication data found.');
      }
      final accessToken = jsonDecode(authData)['access_token'];

      // Prepare the multipart request
      final multipartRequest = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $accessToken'
        ..headers['Content-Type'] =
            'multipart/form-data; boundary=<calculated when request is sent>'
        ..fields['user_id'] = request.userId ?? '';

      // Attach the face scan file if it exists
      if (request.faceScan != null) {
        multipartRequest.files.add(
          await http.MultipartFile.fromPath('image', request.faceScan!.path),
        );
      }

      final streamedResponse = await multipartRequest.send();

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data =
            response.body.isNotEmpty ? jsonDecode(response.body)['data'] : null;
        if (data != null) {
          // Assuming data includes detectedMood, confidenceScore, recommendedTracks, playlistId
          return Right(Data.fromJson(data));
        } else {
          return Left(
              data != null ? data['message'] : 'Unexpected error occurred.');
        }
      } else {
        final data =
            response.body.isNotEmpty ? jsonDecode(response.body) : null;
        return Left(data != null
            ? data['message']
            : 'Failed. Server returned status code ${response.statusCode}.');
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left('Failed to process face scan: $e');
    }
  }
}
