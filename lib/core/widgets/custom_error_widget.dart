import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key, required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: AppStyles.errorTextStyle,
        softWrap: true,
      ),
    );
  }
}
