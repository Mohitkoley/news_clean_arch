import 'package:flutter/material.dart';

extension on BuildContext {
  void showSnackBar(
    String message,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: true,
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
