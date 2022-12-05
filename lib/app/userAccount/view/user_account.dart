import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testprojetc/app/login/services/login_services.dart';

import '../../login/models/user_infomation_model.dart';
import '../../login/view/login_screen.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UserAccount",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,letterSpacing: 2),),
          actions: [
            TextButton(
                onPressed: () {
                  LoginService().logOutUser().then((value) {
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  height: 30,
                  width: 100,
                  child: const Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<User?>(
              future: User.getUserInformation(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://stage.getsetplay.co/${snapshot.data!.avatar}",
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.person_alt,
                                  size: 30,
                                ),
                                Text(
                                  "${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.at,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data!.email,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.device_phone_portrait,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data!.mobile,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.arrow_branch,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data!.gender,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.briefcase_fill,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data!.accountType,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.building_2_fill,
                                  size: 30,
                                ),
                                Text(
                                  snapshot.data!.city,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
