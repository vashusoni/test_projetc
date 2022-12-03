import 'dart:convert';
import 'dart:developer';

import 'package:testprojetc/app/model/test_model_one.dart';
import 'package:http/http.dart' as http;

class TestServices {
  Future<List<NearEarthObject>> getTestData() async {
    List<NearEarthObject> testData = [];
    var request = http.get(Uri.parse('https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=xGPCS7zjFUvqmOOnY2O5vkg5BUQ2cybQYswKnLRU'));

    http.StreamedResponse response = await request.send();
    log("check_response:-${response.request}");
    var data=jsonDecode(request);

    if (response.statusCode == 200) {
      log("check_1");
      for (Map i in data) {
        testData.add(NearEarthObject.fromMap(i));
      }
log("Check_testData:${testData}");
      return testData;
    } else {
      print(response.reasonPhrase);
    }
    return Future.error("ChecK_erro");
  }
}
