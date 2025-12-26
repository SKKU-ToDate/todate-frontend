/// 인증 토큰 엔티티
///
/// JWT 액세스 토큰과 리프레시 토큰을 포함합니다.
class AuthToken {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  AuthToken({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });
}
