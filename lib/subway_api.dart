import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subway_search_app/subway.dart';

class SubwayApi {
  SubwayApi() {
    fetchInfo('');
  }

  final _subwayStreamController = StreamController<List<Subway>>();

  Stream<List<Subway>> get imageStream => _subwayStreamController.stream;

  Future fetchInfo(String query) async {
    List<Subway> info = await getInfo(query);
    _subwayStreamController.add(info);
  }

  Future<List<Subway>> getInfo(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    Iterable realtimeArrivalList = json['realtimeArrivalList'];
    return realtimeArrivalList.map((e) => Subway.fromJson(e)).toList();
  }
}
