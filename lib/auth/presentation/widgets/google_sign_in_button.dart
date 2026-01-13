import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

/// Google 로그인 버튼 위젯
class GoogleSignInButton extends ConsumerStatefulWidget {
  final Function(String) onSignInFailure;

  const GoogleSignInButton({
    super.key,
    required this.onSignInFailure,
  });

  @override
  ConsumerState<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends ConsumerState<GoogleSignInButton> {
  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    debugPrint('[GoogleSignInButton] 로그인 시작');
    setState(() => _isLoading = true);

    try {
      debugPrint('[GoogleSignInButton] authNotifier.signInWithGoogle() 호출');
      await ref.read(authProvider.notifier).signInWithGoogle();
      debugPrint('[GoogleSignInButton] 로그인 성공');
      // Riverpod이 자동으로 상태를 업데이트하므로 화면이 자동으로 MainScreen으로 전환됨
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
