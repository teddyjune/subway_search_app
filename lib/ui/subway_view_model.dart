import 'package:flutter/material.dart';
import 'package:subway_search_app/data/data_source/subway_api_impl.dart';
import 'package:subway_search_app/data/model/subway.dart';
import 'package:subway_search_app/data/repository/subway_repository.dart';

class SubwayViewModel extends ChangeNotifier {
  final _repository = SubwayRepository(SubwayApiImpl());
  List<Subway> arrivalInfo = [];

  void fetchInfo(String query) async {
    arrivalInfo = await _repository.getInfo(query);
    notifyListeners();
  }
}
