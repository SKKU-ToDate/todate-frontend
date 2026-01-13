import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LogoutButton extends ConsumerWidget {
  final VoidCallback? onLogoutSuccess;

  const LogoutButton({
    super.key,
    this.onLogoutSuccess,
  });

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authProvider.notifier).signOut();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그아웃되었습니다')),
        );

        onLogoutSuccess?.call();
        // Riverpod이 자동으로 상태를 업데이트하므로 화면이 자동으로 LoginScreen으로 전환됨
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('로그아웃 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => _handleLogout(context, ref),
      child: const Text('로그아웃'),
    );
  }
}
