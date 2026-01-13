import '../entities/auth_token.dart';

/// 인증 리포지토리 인터페이스
///
/// 인증 관련 비즈니스 로직을 정의합니다.
abstract class AuthRepository {
  /// Google 로그인
  Future<AuthToken> signInWithGoogle();

  /// 로그아웃
  Future<void> signOut();

  /// 액세스 토큰 가져오기
  Future<String?> getAccessToken();

  /// 인증 상태 확인
  Future<bool> isAuthenticated();

  /// 저장된 사용자 이름(이메일) 가져오기
  Future<String?> getUsername();

  /// 저장된 사용자 이름 가져오기
  Future<String?> getName();
}
