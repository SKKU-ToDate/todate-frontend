import 'package:flutter/material.dart';
import 'package:todate/global/core/presentation/screens/profile_screen.dart';

import '../../../style/color_styles.dart';
import '../components/base_navigation_bar.dart';
import 'date_course_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DateCourseScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BaseNavigationBar(
        selectedIndex: _selectedIndex,
        handleDestinationSelected: _onItemTapped,
        destinations: _buildNavigationDestinations(_selectedIndex),
      ),
    );
  }

  List<NavigationDestination> _buildNavigationDestinations(int currentIndex) {
    final List<IconData> icons = [
      Icons.home_outlined,
      Icons.favorite_border,
      Icons.person_outline,
    ];
    final List<IconData> selectedIcons = [
      Icons.home,
      Icons.favorite,
      Icons.person,
    ];
    final List<String> labels = ['홈', '데이트 코스', '프로필'];

    return List.generate(labels.length, (index) {
      final bool isSelected = index == currentIndex;
      return NavigationDestination(
        icon: Icon(
          icons[index],
          color: isSelected
              ? ColorStyles.highlightDarkest
              : ColorStyles.neutralDarkLight,
        ),
        selectedIcon: Icon(
          selectedIcons[index],
          color: ColorStyles.highlightDarkest,
        ),
        label: labels[index],
      );
    });
  }
}
