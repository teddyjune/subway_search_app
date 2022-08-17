import 'package:subway_search_app/data/data_source/subway_api.dart';
import 'package:subway_search_app/data/model/subway.dart';

class SubwayRepository {
  final _api = SubwayApi();

  Future<List<Subway>> getInfo(String query) async {
    return await _api.getInfo(query);
  }
}
