import 'package:flutter/material.dart';
import 'package:subway_search_app/subway.dart';
import 'package:subway_search_app/subway_api.dart';

class SubwayViewModel extends ChangeNotifier {
  final _subwayApi = SubwayApi();
  List<Subway> arrivalInfo = [];

  void fetchInfo(String query) async {
    arrivalInfo = await _subwayApi.getInfo(query);
    notifyListeners();
  }
}
