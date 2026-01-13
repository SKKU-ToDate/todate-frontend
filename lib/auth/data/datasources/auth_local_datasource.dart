import '../../../global/core/storage/secure_storage_service.dart';

/// 인증 로컬 데이터 소스
///
/// 토큰을 안전한 로컬 저장소에 저장/읽기/삭제합니다.
class AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSource({required this.storage});

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _usernameKey = 'username';
  static const String _nameKey = 'name';

  /// 액세스 토큰과 리프레시 토큰 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await storage.write(_accessTokenKey, accessToken);
    await storage.write(_refreshTokenKey, refreshToken);
  }

  /// 사용자 정보 저장
  Future<void> saveUserInfo({
    required String username,
    required String name,
  }) async {
    await storage.write(_usernameKey, username);
    await storage.write(_nameKey, name);
  }

  /// 액세스 토큰 가져오기
  Future<String?> getAccessToken() async {
    return await storage.read(_accessTokenKey);
  }

  /// 리프레시 토큰 가져오기
  Future<String?> getRefreshToken() async {
    return await storage.read(_refreshTokenKey);
  }

  /// 사용자 이름(이메일) 가져오기
  Future<String?> getUsername() async {
    return await storage.read(_usernameKey);
  }

  /// 사용자 이름 가져오기
  Future<String?> getName() async {
    return await storage.read(_nameKey);
  }

  /// 모든 토큰 및 사용자 정보 삭제
  Future<void> deleteTokens() async {
    await storage.delete(_accessTokenKey);
    await storage.delete(_refreshTokenKey);
    await storage.delete(_usernameKey);
    await storage.delete(_nameKey);
  }
}
