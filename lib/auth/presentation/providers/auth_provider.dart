import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/repositories/auth_repository.dart';

/// AuthNotifier - 인증 상태를 관리하는 Riverpod Notifier
///
/// Google 로그인, 자동 로그인, 로그아웃 등의 기능을 제공합니다.
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState.initial()) {
    // 초기화 시 자동 로그인 체크
    checkAutoLogin();
  }

  /// 앱 시작 시 자동 로그인 체크
  Future<void> checkAutoLogin() async {
    try {
      debugPrint('[AuthNotifier] 자동 로그인 체크 시작');
      state = state.copyWith(isLoading: true);

      final isAuth = await _authRepository.isAuthenticated();

      if (isAuth) {
        final username = await _authRepository.getUsername();
        final name = await _authRepository.getName();

        if (username != null && name != null) {
          debugPrint('[AuthNotifier] 자동 로그인 성공: $username');
          state = AuthState.authenticated(
            username: username,
            name: name,
          );
        } else {
          debugPrint('[AuthNotifier] 사용자 정보 없음 - 비인증 상태');
          state = const AuthState.unauthenticated();
        }
      } else {
        debugPrint('[AuthNotifier] 비인증 상태');
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      debugPrint('[AuthNotifier] 자동 로그인 체크 에러: $e');
      state = const AuthState.unauthenticated();
    }
  }

  /// Google 로그인
  Future<void> signInWithGoogle() async {
    try {
      debugPrint('[AuthNotifier] Google 로그인 시작');
      state = state.copyWith(isLoading: true);

      final authToken = await _authRepository.signInWithGoogle();

      debugPrint('[AuthNotifier] 로그인 성공: ${authToken.username}');
      state = AuthState.authenticated(
        username: authToken.username,
        name: authToken.name,
      );
    } catch (e) {
      debugPrint('[AuthNotifier] 로그인 에러: $e');
      state = const AuthState.unauthenticated();
      rethrow;
    }
  }

  /// 로그아웃
  Future<void> signOut() async {
    try {
      debugPrint('[AuthNotifier] 로그아웃 시작');
      await _authRepository.signOut();

      debugPrint('[AuthNotifier] 로그아웃 성공');
      state = const AuthState.unauthenticated();
    } catch (e) {
      debugPrint('[AuthNotifier] 로그아웃 에러: $e');
      rethrow;
    }
  }
}

/// AuthProvider - 전역 인증 상태 Provider
///
/// 앱 전체에서 인증 상태를 관리하고 접근할 수 있습니다.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  throw UnimplementedError('authProvider는 main.dart에서 override되어야 합니다');
});
