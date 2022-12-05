// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    Key? key, required this.onTap,
  }) : super(key: key);
  final Function () onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
            color: AppColors.appGreen,
            shape: BoxShape.circle),
        child: Center(
            child: Icon(
              CupertinoIcons.arrow_right,
              color: Colors.white,
            )),
      ),
    );
  }
}