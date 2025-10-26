import 'package:flutter/material.dart';

import '../global/core/presentation/components/base_app_bar.dart';
import '../global/core/presentation/components/profile_menu_item.dart';
import '../global/style/color_styles.dart';
import '../global/style/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 실제 사용자 데이터 (닉네임, 프로필 이미지 URL) 가져오는 로직 필요
  String _nickname = '투데잇';
  String? _profileImageUrl; // null이면 기본 아이콘 표시
  // File? _selectedImageFile; // 나중에 이미지 선택 시 사용

  // TODO: 이미지 변경 로직 구현 (ImagePicker 패키지 등 사용)
  void _pickImage() async {
    // ImagePicker 로직...
    // 서버에 업로드 후 _profileImageUrl 업데이트...
    print('이미지 변경 버튼 눌림');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        title: '프로필',
        centerTitle: true,
        showBackButton: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 133,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: ColorStyles.highlightLightest,
                        borderRadius: BorderRadius.circular(32.0),
                        image: _profileImageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(_profileImageUrl!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _profileImageUrl == null
                          ? const Center(
                              child: Icon(
                                Icons.person, // 기본 아이콘
                                color: ColorStyles.highlightLight,
                                size: 80,
                              ),
                            )
                          : null,
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: ColorStyles.highlightDarkest,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _nickname,
                  style: TextStyles.heading3.copyWith(
                    color: ColorStyles.neutralDarkDarkest,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 44.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                ProfileMenuItem(
                  title: '닉네임 변경',
                  onTap: () {
                    // TODO: 닉네임 변경 화면으로 이동
                    print('닉네임 변경 눌림');
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: ColorStyles.neutralLightMedium,
                ),
                ProfileMenuItem(
                  title: '비밀번호 변경',
                  onTap: () {
                    // TODO: 비밀번호 변경 화면으로 이동
                    print('비밀번호 변경 눌림');
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: ColorStyles.neutralLightMedium,
                ),
                ProfileMenuItem(
                  title: '연인 설정',
                  onTap: () {
                    // TODO: 연인 설정 화면으로 이동
                    print('연인 설정 눌림');
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: ColorStyles.neutralLightMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
