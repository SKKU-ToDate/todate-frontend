import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
    final url = '${EnvConfig.baseUrl}/auth/google';
    debugPrint('[AuthRemoteDataSource] POST 요청 시작: $url');
    debugPrint('[AuthRemoteDataSource] ID Token 길이: ${idToken.length}');

    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': idToken}),
    );

    debugPrint('[AuthRemoteDataSource] 응답 상태 코드: ${response.statusCode}');
    debugPrint('[AuthRemoteDataSource] 응답 본문: ${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint('[AuthRemoteDataSource] 응답 파싱 성공');
      return result;
    } else {
      debugPrint('[AuthRemoteDataSource] 로그인 실패: ${response.statusCode}');
      debugPrint('[AuthRemoteDataSource] 에러 응답: ${response.body}');
      throw Exception('Login failed: ${response.statusCode}');
    }
  }
}
