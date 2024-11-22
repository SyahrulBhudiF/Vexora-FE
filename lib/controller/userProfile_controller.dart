import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

import '../data/models/dto/Request/userProfileUpdate_dto.dart';

class UserProfileController {
  final Logger _logger = Logger('UserProfileController');
  static const String _baseUrl = 'http://192.168.64.7:5555/api/v1';

  Future<Either<String, User>> user() async {
    try {
      _logger.info('user');
      final url = Uri.parse('$_baseUrl/user');
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
        return Right(User.fromJson(jsonDecode(response.body)['data']));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }

  Future<Either<String, User>> updateProfile(
      UserUpdateRequestDto request) async {
    try {
      _logger.info('updateProfile');
      final url = Uri.parse('$_baseUrl/user');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];

      // Membuat MultipartRequest
      var requestData = http.MultipartRequest('PUT', url)
        ..headers['Authorization'] = "Bearer $accessToken";

      // Menambahkan data lainnya (name, email, username)
      requestData.fields['name'] = request.name;
      requestData.fields['email'] = request.email;
      requestData.fields['username'] = request.username;

      // Menambahkan file gambar
      var profilePictureFile = await http.MultipartFile.fromPath(
        'profile_picture', // nama field untuk gambar sesuai API
        request.profilePicture.path,
      );
      requestData.files.add(profilePictureFile);

      // Mengirimkan request dan menerima response
      var response = await requestData.send();

      _logger.info('Response status: ${response.statusCode}');

      // Pastikan body response dibaca dengan benar
      final responseBody = await response.stream.bytesToString();

      _logger.info('Response body: $responseBody');

      // Mengecek jika status kode 200
      if (response.statusCode == 200) {
        // Jika berhasil, decode response body dan return User
        return Right(User.fromJson(jsonDecode(responseBody)['data']));
      } else {
        // Jika gagal, return pesan error
        return Left(jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      _logger.severe("Error: $e");
      return Left(e.toString());
    }
  }
}
