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
    // 1. Google Sign-In으로 사용자 인증 (v7.x API)
    final GoogleSignInAccount account = await googleSignIn.authenticate();

    // 2. ID Token 받기
    final GoogleSignInAuthentication auth = account.authentication;
    final String? idToken = auth.idToken;
    if (idToken == null) {
      throw Exception('Failed to get ID token');
    }

    // 3. 백엔드에 ID Token 전송하여 JWT 받기
    final tokenData = await remoteDataSource.loginWithGoogle(idToken);
    final authToken = AuthTokenModel.fromJson(tokenData);

    // 4. JWT 토큰 로컬 저장
    await localDataSource.saveTokens(
      accessToken: authToken.accessToken,
      refreshToken: authToken.refreshToken,
    );

    return authToken;
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
}
