import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subway_search_app/data/data_source/subway_api.dart';
import 'package:subway_search_app/data/data_source/subway_dto.dart';

class SubwayApiImpl implements SubwayApi {
  final http.Client _client;

  SubwayApiImpl({http.Client? client}) : _client = (client ?? http.Client());

  @override
  Future<SubwayDto> getInfo(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');
    http.Response response = await _client.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    return SubwayDto.fromJson(json);
  }
}
