import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/auth_token_model.dart';

/// 인증 리포지토리 구현체
///
/// Google Sign-In, Remote API, Local Storage를 통합하여
/// 인증 비즈니스 로직을 구현합니다.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.googleSignIn,
  });

  @override
  Future<AuthToken> signInWithGoogle() async {
    try {
      // 1. Google Sign-In으로 사용자 인증 (v7.x API)
      // scope 지정: email, profile
      debugPrint('[AuthRepository] 1. Google Sign-In 시작');
      final GoogleSignInAccount account = await googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      debugPrint('[AuthRepository] Google Sign-In 성공: ${account.email}');

      // 2. ID Token 받기
      debugPrint('[AuthRepository] 2. ID Token 받기 시작');
      final GoogleSignInAuthentication auth = account.authentication;
      final String? idToken = auth.idToken;
      if (idToken == null) {
        debugPrint('[AuthRepository] ID Token이 null입니다');
        throw Exception('Failed to get ID token');
      }
      debugPrint('[AuthRepository] ID Token 받기 성공 (길이: ${idToken.length})');

      // 3. 백엔드에 ID Token 전송하여 JWT 받기
      debugPrint('[AuthRepository] 3. 백엔드에 ID Token 전송 시작');
      final tokenData = await remoteDataSource.loginWithGoogle(idToken);
      debugPrint('[AuthRepository] 백엔드 응답 받음: ${tokenData.keys}');
      final authToken = AuthTokenModel.fromJson(tokenData);
      debugPrint('[AuthRepository] JWT 토큰 파싱 성공');

      // 4. JWT 토큰 및 사용자 정보 로컬 저장
      debugPrint('[AuthRepository] 4. JWT 토큰 및 사용자 정보 로컬 저장 시작');
      await localDataSource.saveTokens(
        accessToken: authToken.accessToken,
        refreshToken: authToken.refreshToken,
      );
      await localDataSource.saveUserInfo(
        username: authToken.username,
        name: authToken.name,
      );
      debugPrint('[AuthRepository] JWT 토큰 및 사용자 정보 로컬 저장 완료');

      debugPrint('[AuthRepository] 전체 로그인 프로세스 성공');
      return authToken;
    } catch (e, stackTrace) {
      debugPrint('[AuthRepository] 로그인 중 에러 발생: $e');
      debugPrint('[AuthRepository] Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await localDataSource.deleteTokens();
  }

  @override
  Future<String?> getAccessToken() async {
    return await localDataSource.getAccessToken();
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String?> getUsername() async {
    return await localDataSource.getUsername();
  }

  @override
  Future<String?> getName() async {
    return await localDataSource.getName();
  }
}
