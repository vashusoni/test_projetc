import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/basUrl.dart';
import '../../utils/helper.dart';
import '../models/user_infomation_model.dart';

class LoginService with ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  Future<UserInformationModel> userLogin(BuildContext context) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var client = http.Client();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=gd1mk1uskejnojkl9elfvnahba'
    };

    var response = await client.post(
        Uri.parse("${BaseUrl.baseLoginUrl}/login.php"),
        body: jsonEncode({
          "username": userNameController.text,
          "password": userPasswordController.text
        }));
    try {
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body.toString());

        UserInformationModel userInformation =
            UserInformationModel.fromJson(decodedResponse);
        User? user=userInformation.data.user;
        user.saveUserInformation();
        sharedPreferences.setString(
            "token", userInformation.data.token.toString());
        Helper(context).showSnackBar("Hello..${userInformation.data.user.firstName}  ${userInformation.data.user.lastName}", true);

        // if (sharedPreferences.getString("token") != null) {}
        return userInformation;
      }
    } catch (e) {
      Helper(context).showSnackBar("${response.statusCode}  ${"Login failed..!"}", false);
      log("Error_in_login_method:-$e");
    }
    Helper(context).showSnackBar("${response.statusCode}  ${"Login failed..!"}", false);
    return Future.error("login_response_statusCode:-\n");
  }

  Future<bool> logOutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    if (sharedPreferences.getString("token") == null) {
      return true;
    }
    return false;
  }
}
