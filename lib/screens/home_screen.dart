import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final googleSignIn = GoogleSignIn.instance;

    // 로그인 이벤트 리스너 등록
    googleSignIn.authenticationEvents.listen((event) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        setState(() {
          _currentUser = event.user;
        });
      } else if (event is GoogleSignInAuthenticationEventSignOut) {
        setState(() {
          _currentUser = null;
        });
      }
    });

    // 이미 로그인되어 있다면 lightweight authentication으로 사용자 정보 가져오기
    try {
      final user = await googleSignIn.attemptLightweightAuthentication();
      if (user != null) {
        setState(() {
          _currentUser = user;
        });
      }
    } catch (e) {
      // 로그인되어 있지 않으면 무시
      debugPrint('Not signed in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 화면')),
      body: Center(
        child: _currentUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentUser!.photoUrl != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_currentUser!.photoUrl!),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    '이름: ${_currentUser!.displayName ?? "없음"}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '이메일: ${_currentUser!.email}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ID: ${_currentUser!.id}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
