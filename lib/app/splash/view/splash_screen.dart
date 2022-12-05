import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testprojetc/app/login/view/login_screen.dart';
import 'package:testprojetc/app/product/view/product_view.dart';
import 'package:testprojetc/app/utils/size_config.dart';

import '../../Dashbord/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double height = SizeConfig.heightMultiplier!;
  double width = SizeConfig.widthMultiplier!;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      checkUserToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash_image/nykaa.png"),
      ),
    );
  }

  void checkUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userToken = sharedPreferences.getString("token") ?? "";
    if (userToken == "") {
      navigateLoginScreen();
      return;
    }
    navigateDashBordScreen();
  }

  void navigateLoginScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  void navigateDashBordScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashBordScreen()),
        (route) => false);
  }
}
