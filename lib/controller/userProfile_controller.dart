import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

import '../data/models/dto/Request/userProfileUpdate_dto.dart';

class UserProfileController {
  final Logger _logger = Logger('UserProfileController');

  static const String _baseUrl = 'http://192.168.245.249:5555/api/v1';

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
      UserUpdateRequestDto userProfileUpdateDto) async {
    try {
      // Menggunakan endpoint /user untuk memperbarui nama dan username
      final response = await http.put(
        Uri.parse('$_baseUrl/user'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': userProfileUpdateDto.name,
          'username': userProfileUpdateDto.username,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return Right(User.fromJson(responseBody['data']));
      } else {
        return Left('Failed to update user profile');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, User>> updateProfilePicture(File profilePicture) async {
    try {
      // Menggunakan endpoint /user/profile-picture untuk memperbarui foto profil
      final request = http.MultipartRequest(
        'PUT',
        Uri.parse('$_baseUrl/user/profile-picture'),
      );

      // Menambahkan file gambar ke request
      request.files.add(await http.MultipartFile.fromPath(
        'profile_picture',
        profilePicture.path,
      ));

      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];
      request.headers['Authorization'] = 'Bearer $accessToken';

      // Mengirimkan request
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return Right(User.fromJson(jsonDecode(responseBody)['data']));
      } else {
        return Left('Failed to update profile picture');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}
