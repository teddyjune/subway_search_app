import 'package:subway_search_app/data/data_source/subway_dto.dart';

abstract class SubwayApi {
  Future<SubwayDto> getInfo(String query);
}
