import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 안전한 로컬 저장소 서비스
///
/// flutter_secure_storage를 래핑하여 토큰 및 민감한 데이터를
/// 안전하게 저장/읽기/삭제합니다.
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// 키-값 쌍 저장
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// 키로 값 읽기
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// 키로 값 삭제
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// 모든 값 삭제
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
