import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subway_search_app/data/model/subway.dart';

class SubwayApi {
  Future<List<Subway>> getInfo(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['realtimeArrivalList'] == null) {
      return List.empty();
    }
    Iterable realtimeArrivalList = json['realtimeArrivalList'];
    return realtimeArrivalList.map((e) => Subway.fromJson(e)).toList();
  }
}
