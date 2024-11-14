import 'package:vexora_fe/core/utils/http/http_client.dart';
import 'package:vexora_fe/core/utils/storage/local_storage.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/data/models/dto/Request/register_dto.dart';
import 'package:logging/logging.dart';

class AuthController {
  final Logger _logger = Logger('AuthController');

  Future<Map<String, dynamic>> register(RegisterDto request) async {
    try {
      final response =
          await VexoraHttpClient.post('register', request.toJson());
      _logger.info("Response: $response");

      if (response['data'] == null) {
        throw response['errors'];
      } else {
        return response['data'];
      }
    } catch (e) {
      _logger.severe("Error: $e");
      throw Exception('Failed to register user: $e');
    }
  }

  Future<Map<String, dynamic>> login(LoginDto request) async {
    try {
      final response = await VexoraHttpClient.post('login', request.toJson());

      if (response['data'] == null) {
        throw response['errors'];
      } else {
        final accessToken = response['data']['access_token'];
        await VexoraLocalStorage().saveData('access_token', accessToken);
        _logger.info("Access Token: $accessToken");
        return response['data'];
      }
    } catch (e) {
      _logger.severe("Failed to login user: $e");
      throw Exception('Failed to login user: $e');
    }
  }
}
