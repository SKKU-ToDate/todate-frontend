import 'package:flutter/material.dart';
import '../color_styles.dart';
import '../text_styles.dart';


class SpotCard extends StatelessWidget {

  final String title;
  final String? subtitle;
  final VoidCallback? onDelete;

  const SpotCard({
    super.key,
    required this.title,
    this.subtitle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,//피그마에 적힌대로 69로 했더니 오버플로우 생겨서 78로 일단 조정했습니다.
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          //이거 주석 풀면 테두리 생김
          // side: BorderSide(
          //   color: Colors.grey,
          //   width: 1.2,
          // ),
        ),
        elevation: 0,
        color: ColorStyles.neutralLight40, //배경색입니다!
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyles.headingH4Bold.copyWith(color: ColorStyles.neutralDark100,)),
                  if(subtitle != null)//혹시 오류 날 수도 있대서 넣었습니다.
                    Text(subtitle!,
                        style: TextStyles.bodySRegular.copyWith(color: ColorStyles.neutralDark40)),
                ],
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, color: ColorStyles.neutralDark40),
              ),
            ],
          ),
        ),
      )
    );
  }
}
