// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testprojetc/app/Dashbord/view.dart';
import 'package:testprojetc/app/login/services/login_services.dart';
import 'package:testprojetc/app/utils/size_config.dart';

import '../widgets/forget_password.dart';
import '../widgets/login_bottom_image.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/lotin_top_imge.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_form_filed_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double height = SizeConfig.heightMultiplier!;
  double width = SizeConfig.widthMultiplier!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginService>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SizedBox(
                    height: height * 34.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height * 4.5)),
                        SizedBox(
                          height: height * 2.2,
                        ),
                        Stack(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: height * 6.8),
                                child: Container(
                                    decoration: containerDecoration(),
                                    child: Column(children: [
                                      TextFromFieldWidget(
                                        prefixIcon: Icon(CupertinoIcons.person),
                                        controller: provider.userNameController,
                                        hint: "UserName",
                                        obscureText: false,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      TextFromFieldWidget(
                                          prefixIcon: Icon(CupertinoIcons.lock),
                                          controller:
                                              provider.userPasswordController,
                                          hint: "Password",
                                          obscureText: false)
                                    ]))),
                            Positioned(
                                top: height*2.8,
                                right: width*7.6,
                                child: LoginButtonWidget(onTap: () {
                                  provider.userLogin(context).then((value) {
                                    navigateDashBordScreen();
                                  });
                                }))
                          ],
                        ),
                        ForgotPasswordWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              LoginTopImage(),
              LoginBottomImage(),
              Positioned(bottom:height*16, child: RegisterButton(onTap: () {})),
            ],
          ),
        );
      }),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100), topRight: Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          )
        ]);
  }

  void navigateDashBordScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashBordScreen()),
          (route) => false);
    }
  }
}
