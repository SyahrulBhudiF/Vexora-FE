import 'package:dio/dio.dart';
import 'package:vexora_fe/core/utils/storage/local_storage.dart'; // Adjust the path as necessary

class DisHttpClient {
  static const String _baseUrl = 'http://localhost:5555/api/v1';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  // GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final headers = await _getHeaders();
    try {
      final response = await _dio.get(endpoint, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    try {
      final response = await _dio.post(endpoint, data: body, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    try {
      final response = await _dio.put(endpoint, data: body, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final headers = await _getHeaders();
    try {
      final response = await _dio.delete(endpoint, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // PATCH request
  static Future<Map<String, dynamic>> patch(String endpoint, dynamic body) async {
    final headers = await _getHeaders();
    try {
      final response = await _dio.patch(endpoint, data: body, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // Multipart request
  static Future<Map<String, dynamic>> multipart(String endpoint, Map<String, String> files, Map<String, String> fields) async {
    final headers = await _getHeaders();
    final formData = FormData();

    files.forEach((key, filePath) async {
      formData.files.add(MapEntry(
        key,
        await MultipartFile.fromFile(filePath, filename: key),
      ));
    });

    fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value));
    });

    try {
      final response = await _dio.post(endpoint, data: formData, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // Retrieve headers including token
  static Future<Map<String, String>> _getHeaders() async {
    final token = await DisLocalStorage().readData<String>('access_token');
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Handle the response
  static Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception('Failed to load data: ${response.statusMessage}');
    }
  }

  // Handle errors
  static Map<String, dynamic> _handleError(Object error) {
    if (error is DioException) {
      return {
        'error': true,
        'message': error.response?.data ?? 'Something went wrong',
      };
    } else {
      return {
        'error': true,
        'message': 'Unexpected error',
      };
    }
  }
}
