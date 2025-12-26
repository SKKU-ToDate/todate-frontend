import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 환경 변수 관리 클래스
///
/// flutter_dotenv를 사용하여 .env 파일의 환경변수를 관리합니다.
class EnvConfig {
  /// 백엔드 API 기본 URL
  static String get baseUrl =>
      dotenv.get('BASE_URL', fallback: 'http://localhost:8080');

  /// Google OAuth 클라이언트 ID
  static String get googleClientId =>
      dotenv.get('GOOGLE_CLIENT_ID', fallback: '');
}
