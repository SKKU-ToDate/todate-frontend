import 'package:flutter/material.dart';
import 'package:todate/global/core/presentation/components/base_app_bar.dart';
import 'package:todate/global/core/presentation/components/course_card.dart';
import 'package:todate/global/style/color_styles.dart';
import 'package:todate/global/style/text_styles.dart';

import '../ui/button/primary_button.dart';
import '../ui/contect_switcher/context_switcher.dart';

// --- 테스트용 가짜 데이터 모델 ---
class CourseData {
  final String title;
  final String date;
  final String? imageUrl;
  CourseData({required this.title, required this.date, this.imageUrl});
}
// ------------------------------

class DateCourseScreen extends StatefulWidget {
  const DateCourseScreen({super.key});
  @override
  State<DateCourseScreen> createState() => _DateCourseScreenState();
}

class _DateCourseScreenState extends State<DateCourseScreen> {
  int _switcherIndex = 0;

  // --- 가짜 데이터 ---
  final List<CourseData> _toDateCourses = List.generate(
    15,
    (index) => CourseData(
      title: 'ToDate 코스 ${index + 1}',
      date: '10/${25 + index} 토요일',
      imageUrl: index % 2 == 0
          ? 'https://picsum.photos/100/${100 + index}'
          : null,
    ),
  );
  final List<CourseData> _historyCourses = [];
  List<CourseData> get _currentList =>
      _switcherIndex == 0 ? _toDateCourses : _historyCourses;
  // ------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: '데이트 코스',
        centerTitle: true,
        showBackButton: false,
        action: IconButton(
          icon: const Icon(Icons.search, color: ColorStyles.highlightDarkest),
          onPressed: () {
            /* TODO: 검색 */
          },
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ContextSwitcher(
              text: const ['ToDate', 'History'],
              onIndexChanged: (index) {
                setState(() {
                  _switcherIndex = index;
                });
              },
            ),
          ),

          Expanded(
            child: _currentList.isEmpty
                ? _buildEmptyView()
                : _buildCourseListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('아직 등록된 코스가 없어요.', style: TextStyles.heading2),
          const SizedBox(height: 20),
          const Text('There is no course.', style: TextStyles.bodyM),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: PrimaryButton(
              text: '데이트하러 가기',
              onPressed: () {
                /* TODO: 코스 추가 */
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseListView() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            itemCount: _currentList.length,
            itemBuilder: (context, index) {
              final course = _currentList[index];

              return Dismissible(
                key: ValueKey(course.title + course.date),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  setState(() {
                    _currentList.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${course.title} 코스가 삭제되었습니다.'),
                      action: SnackBarAction(
                        label: '취소',
                        onPressed: () {
                          setState(() {
                            _currentList.insert(index, course);
                          });
                        },
                      ),
                    ),
                  );
                  // TODO: 백엔드 API 호출하여 서버에서도 삭제
                },

                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '삭제',
                    style: TextStyles.bodyM.copyWith(color: Colors.white),
                  ),
                ),

                child: CourseCard(
                  title: course.title,
                  date: course.date,
                  imageUrl: course.imageUrl,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 24,
              thickness: 1,
              color: ColorStyles.neutralLightDark,
              indent: 0,
              endIndent: 0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: PrimaryButton(
            text: '코스 추가',
            onPressed: () {
              /* TODO: 코스 추가 로직 */
            },
          ),
        ),
      ],
    );
  }
}
