import 'package:flutter/material.dart';
import 'package:testprojetc/app/utils/size_config.dart';
class LoginTopImage extends StatelessWidget {
   LoginTopImage({
    Key? key,
  }) : super(key: key);
double height=SizeConfig.heightMultiplier!;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        child: Image.asset(
          "assets/login_image/img_top.png",
          height: height*22.9,
          width: MediaQuery.of(context).size.width - 80,
        ));
  }
}