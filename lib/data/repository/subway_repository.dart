import 'package:subway_search_app/data/model/subway.dart';

import '../data_source/subway_api.dart';

class SubwayRepository {
  final SubwayApi _api;

  SubwayRepository(this._api);

  Future<List<Subway>> getInfo(String query) async {
    final subwayDto = await _api.getInfo(query);
    if ((subwayDto.realtimeArrivalList?.length ?? 0) == 0) {
      return [];
    }
    return subwayDto.realtimeArrivalList!
        .map((e) => Subway(
              arrivalMessage: e.arvlMsg2 ?? '',
              heading: e.trainLineNm ?? '',
            ))
        .toList();
  }
}
