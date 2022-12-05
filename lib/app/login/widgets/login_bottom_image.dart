import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class LoginBottomImage extends StatelessWidget {
  const LoginBottomImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.heightMultiplier!;
    double width = SizeConfig.widthMultiplier!;

    return Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset(
          "assets/login_image/img_bottum.png",
          height: height*20.6,
          width: MediaQuery.of(context).size.width - 100,
        ));
  }
}