import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_styles.dart';

class TitleListViewAndSeeMore extends StatelessWidget {
  const TitleListViewAndSeeMore({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.styles19W500),
          InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('See More'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
