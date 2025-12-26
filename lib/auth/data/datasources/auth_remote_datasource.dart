import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../global/core/config/env_config.dart';

/// 인증 원격 데이터 소스
///
/// 백엔드 API와 통신하여 인증 처리를 수행합니다.
class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  /// Google ID Token을 백엔드에 전송하여 JWT 토큰 받기
  Future<Map<String, dynamic>> loginWithGoogle(String idToken) async {
    final response = await client.post(
      Uri.parse('${EnvConfig.baseUrl}/auth/google'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': idToken}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  }
}
