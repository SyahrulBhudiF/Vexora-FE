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

  static const String _baseUrl = 'https://vexora.gjdev.tech/api/v1';

  Future<Either<String, User>> user() async {
    try {
      _logger.info('user');
      final url = Uri.parse('$_baseUrl/user');
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      print('token');
      print(authData);
      if (authData == null) {
        return Left("No authentication data found");
      }
      final accessToken = jsonDecode(authData)['access_token'];
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
      );
      print('data user');
      print(response.body);
      print(response.statusCode);

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

  Future<Either<String, void>> updateProfile(
      UserUpdateRequestDto userProfileUpdateDto) async {
    try {
      // Mendapatkan token dari shared preferences
      final prefs = await SharedPreferences.getInstance();
      final authData = prefs.getString('auth_data');
      final accessToken = jsonDecode(authData!)['access_token'];

      // Menggunakan endpoint /user untuk memperbarui nama dan username
      final response = await http.put(
        Uri.parse('$_baseUrl/user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
        body: jsonEncode(userProfileUpdateDto.toJson()),
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return const Left('Failed to update user profile');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, void>> updateProfilePicture(File image) async {
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final url = Uri.parse('$_baseUrl/user/profile-picture');

        final prefs = await SharedPreferences.getInstance();
        final authData = prefs.getString('auth_data');
        final accessToken = jsonDecode(authData!)['access_token'];

        var request = http.MultipartRequest('PUT', url)
          ..headers['Authorization'] = 'Bearer $accessToken'
          ..files.add(await http.MultipartFile.fromPath(
            'image',
            image.path,
          ));

        final response = await request.send();
        print('update profile picture');
        print(response.statusCode);
        if (response.statusCode == 200) {
          return const Right(null);
        } else {
          final responseBody = await http.Response.fromStream(response);
          final errorMessage = jsonDecode(responseBody.body)['message'];
          return Left(errorMessage ?? 'Failed to update profile picture');
        }
      } catch (error) {
        if (error is SocketException && retryCount < maxRetries - 1) {
          retryCount++;
          await Future.delayed(Duration(seconds: 2)); // Wait before retrying
          continue;
        }
        return Left(error.toString());
      }
    }
    return const Left(
        'Failed to update profile picture after multiple attempts');
  }
}
