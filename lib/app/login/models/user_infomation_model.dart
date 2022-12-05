// To parse this JSON data, do
//
//     final userInformationModel = userInformationModelFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

UserInformationModel userInformationModelFromJson(String str) =>
    UserInformationModel.fromJson(json.decode(str));

String userInformationModelToJson(UserInformationModel data) =>
    json.encode(data.toJson());

class UserInformationModel {
  UserInformationModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  String statusCode;
  String status;
  String message;
  Data data;

  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      UserInformationModel(
        statusCode: json["status_code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  String token;
  String refreshToken;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        refreshToken: json["refresh_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh_token": refreshToken,
        "user": user.toJson(),
      };


}

class User {
  User({
    required this.id,
    required this.avatar,
    required this.mobile,
    required this.groupId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    required this.accountType,
    required this.email,
    required this.city,
    required this.firstPage,
  });

  String id;
  String avatar;
  String mobile;
  String groupId;
  String firstName;
  String lastName;
  String username;
  String gender;
  String dateOfBirth;
  String accountType;
  String email;
  String city;
  String firstPage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"]??"",
        avatar: json["AVATAR"]??"",
        mobile: json["MOBILE"]??"",
        groupId: json["GROUP_ID"]??"",
        firstName: json["FIRST_NAME"]??"",
        lastName: json["LAST_NAME"]??"",
        username: json["USERNAME"]??"",
        gender: json["GENDER"]??"",
        dateOfBirth: json["DATE_OF_BIRTH"]??"",
        accountType: json["ACCOUNT_TYPE"]??"",
        email: json["EMAIL"]??"",
        city: json["CITY"]??"",
        firstPage: json["FIRST_PAGE"]??"",
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "AVATAR": avatar,
        "MOBILE": mobile,
        "GROUP_ID": groupId,
        "FIRST_NAME": firstName,
        "LAST_NAME": lastName,
        "USERNAME": username,
        "GENDER": gender,
        "DATE_OF_BIRTH": dateOfBirth,
        "ACCOUNT_TYPE": accountType,
        "EMAIL": email,
        "CITY": city,
        "FIRST_PAGE": firstPage,
      };

  saveUserInformation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("userInformation", jsonEncode(toJson()));
  }
  static Future<User?> getUserInformation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfoString = preferences.getString("userInformation");
    if (userInfoString != null) {
      return User.fromJson(jsonDecode(userInfoString));
    } else {
      return Future.error("No info available");
    }
  }

}
