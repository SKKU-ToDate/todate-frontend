import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // AppBar 등 필요한 위젯 추가 가능
      body: Center(child: Text('홈 화면')),
    );
  }
}
