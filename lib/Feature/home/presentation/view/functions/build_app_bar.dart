import 'package:flutter/material.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Colors.grey.withValues(alpha: .03),
    title: Text(title),
    centerTitle: true,
  );
}
