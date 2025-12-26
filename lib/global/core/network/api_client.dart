import 'package:http/http.dart' as http;
import '../storage/secure_storage_service.dart';

/// HTTP API 클라이언트
///
/// 모든 요청에 자동으로 Authorization 헤더를 추가하고,
/// 401 에러 발생 시 자동으로 로그아웃 처리합니다.
class ApiClient extends http.BaseClient {
  final http.Client _inner;
  final SecureStorageService _storage;
  final Function()? onUnauthorized;

  ApiClient({
    required http.Client client,
    required SecureStorageService storage,
    this.onUnauthorized,
  })  : _inner = client,
        _storage = storage;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // 액세스 토큰 가져오기
    final token = await _storage.read('access_token');

    // 토큰이 있으면 Authorization 헤더 추가
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    // 요청 전송
    final response = await _inner.send(request);

    // 401 에러 처리 (Unauthorized)
    if (response.statusCode == 401) {
      // 토큰 삭제
      await _storage.delete('access_token');
      await _storage.delete('refresh_token');

      // 로그아웃 콜백 호출
      onUnauthorized?.call();
    }

    return response;
  }
}
