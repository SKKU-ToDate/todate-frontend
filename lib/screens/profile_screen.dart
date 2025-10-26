import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // AppBar 등 필요한 위젯 추가 가능
      body: Center(child: Text('프로필 화면')),
    );
  }
}
