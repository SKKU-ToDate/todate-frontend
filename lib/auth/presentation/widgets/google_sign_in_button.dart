import 'package:flutter/material.dart';
import '../../domain/repositories/auth_repository.dart';

/// Google 로그인 버튼 위젯
class GoogleSignInButton extends StatefulWidget {
  final AuthRepository authRepository;
  final VoidCallback onSignInSuccess;
  final Function(String) onSignInFailure;

  const GoogleSignInButton({
    super.key,
    required this.authRepository,
    required this.onSignInSuccess,
    required this.onSignInFailure,
  });

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    debugPrint('[GoogleSignInButton] 로그인 시작');
    setState(() => _isLoading = true);

    try {
      debugPrint('[GoogleSignInButton] authRepository.signInWithGoogle() 호출');
      await widget.authRepository.signInWithGoogle();
      debugPrint('[GoogleSignInButton] 로그인 성공');
      widget.onSignInSuccess();
    } catch (e) {
      debugPrint('[GoogleSignInButton] 로그인 실패: $e');
      widget.onSignInFailure(e.toString());
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleSignIn,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.login),
                SizedBox(width: 8),
                Text('Google로 로그인'),
              ],
            ),
    );
  }
}
