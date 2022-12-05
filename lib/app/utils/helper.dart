import 'package:flutter/material.dart';
class Helper {
  BuildContext context;

  Helper(this.context);

  showSnackBar(String message, bool successORError,
      {SnackBarAction? snackBarAction, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: successORError ? Colors.green : Colors.red,
        content: Text('$message'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        duration: duration != null ? duration : Duration(seconds: 3),
        action: snackBarAction != null ? snackBarAction : null,
      ),
    );
  }




}