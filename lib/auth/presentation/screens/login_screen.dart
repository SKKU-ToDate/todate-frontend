import 'package:flutter/material.dart';
import '../widgets/google_sign_in_button.dart';
import '../../domain/repositories/auth_repository.dart';

/// 로그인 화면
///
/// Google 로그인 버튼을 제공합니다.
class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;

  const LoginScreen({
    super.key,
    required this.authRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Todate',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              GoogleSignInButton(
                authRepository: authRepository,
                onSignInSuccess: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                onSignInFailure: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 실패: $error')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
