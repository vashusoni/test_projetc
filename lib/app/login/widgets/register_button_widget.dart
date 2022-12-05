import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;
  double height = SizeConfig.heightMultiplier!;
  double width = SizeConfig.widthMultiplier!;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 6.8,
        width: width * 30.7,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        child: Center(
            child: Text(
          "Register",
          style: TextStyle(
              color: Colors.red,
              fontSize: height * 2.04,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
