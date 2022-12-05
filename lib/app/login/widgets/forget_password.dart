import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 80),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot password",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey),
        ),
      ),
    );
  }
}
