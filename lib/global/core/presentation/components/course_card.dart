import 'package:flutter/material.dart';
import 'package:todate/global/style/color_styles.dart';
import 'package:todate/global/style/text_styles.dart';

// TODO: 추후 view 단으로 옯기기

class CourseCard extends StatelessWidget {
  final String title;
  final String date;
  final String? imageUrl;

  const CourseCard({
    super.key,
    required this.title,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16.0,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildDefaultIcon(),
                    )
                  : _buildDefaultIcon(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              Text(
                title,
                style: TextStyles.heading5.copyWith(
                  color: ColorStyles.neutralDarkDarkest,
                ),
              ),
              Text(
                date,
                style: TextStyles.bodyS.copyWith(
                  color: ColorStyles.neutralDarkLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultIcon() {
    return Container(
      width: 100,
      height: 100,
      color: ColorStyles.highlightLightest,
      child: const Center(
        child: Icon(
          Icons.photo_size_select_actual_rounded,
          color: ColorStyles.highlightLight,
          size: 40,
        ),
      ),
    );
  }
}
