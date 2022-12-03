import 'package:flutter/material.dart';

import '../services/test_services.dart';

class TestDataView extends StatefulWidget {
  const TestDataView({Key? key}) : super(key: key);

  @override
  State<TestDataView> createState() => _TestDataViewState();
}

class _TestDataViewState extends State<TestDataView> {
  @override
  void initState() {
    TestServices().getTestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("TextData"),
      ),
    );
  }
}
