/// 인증 상태 엔티티
///
/// 사용자의 로그인 상태와 정보를 나타냅니다.
class AuthState {
  final bool isAuthenticated;
  final String? username;
  final String? name;
  final bool isLoading;

  const AuthState({
    this.isAuthenticated = false,
    this.username,
    this.name,
    this.isLoading = false,
  });

  /// 초기 상태 (로딩 중)
  const AuthState.initial()
      : isAuthenticated = false,
        username = null,
        name = null,
        isLoading = true;

  /// 인증된 상태
  const AuthState.authenticated({
    required this.username,
    required this.name,
  })  : isAuthenticated = true,
        isLoading = false;

  /// 비인증 상태
  const AuthState.unauthenticated()
      : isAuthenticated = false,
        username = null,
        name = null,
        isLoading = false;

  AuthState copyWith({
    bool? isAuthenticated,
    String? username,
    String? name,
    bool? isLoading,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      username: username ?? this.username,
      name: name ?? this.name,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
