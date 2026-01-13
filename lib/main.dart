import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'auth/data/datasources/auth_local_datasource.dart';
import 'auth/data/datasources/auth_remote_datasource.dart';
import 'auth/data/repositories/auth_repository_impl.dart';
import 'auth/presentation/providers/auth_provider.dart';
import 'auth/presentation/screens/login_screen.dart';
import 'global/core/storage/secure_storage_service.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  // Flutter 바인딩 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드
  await dotenv.load(fileName: ".env");

  // 의존성 초기화
  final storage = SecureStorageService();
  final httpClient = http.Client();
  final googleSignIn = GoogleSignIn.instance;

  // GoogleSignIn 초기화
  await googleSignIn.initialize();

  final authRepository = AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSource(client: httpClient),
    localDataSource: AuthLocalDataSource(storage: storage),
    googleSignIn: googleSignIn,
  );

  runApp(
    ProviderScope(
      overrides: [
        authProvider.overrideWith(
          (ref) => AuthNotifier(authRepository),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Todate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _buildHomeScreen(authState),
    );
  }

  Widget _buildHomeScreen(authState) {
    if (authState.isLoading) {
      debugPrint('[App] 인증 상태 확인 중...');
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (authState.isAuthenticated) {
      debugPrint('[App] MainScreen으로 이동');
      return MainScreen();
    } else {
      debugPrint('[App] LoginScreen으로 이동');
      return const LoginScreen();
    }
  }
}
