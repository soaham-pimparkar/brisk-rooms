import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String data,
    {Duration? mDuration, Color? bgColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(data),
    backgroundColor: bgColor,
    duration: mDuration ?? const Duration(seconds: 4),
  ));
}
