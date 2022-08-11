import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_search_app/debounce.dart';
import 'package:subway_search_app/subway.dart';
import 'package:subway_search_app/subway_view_model.dart';

class SubwayRealtimeSearchScreen extends StatefulWidget {
  const SubwayRealtimeSearchScreen({Key? key}) : super(key: key);

  @override
  State<SubwayRealtimeSearchScreen> createState() =>
      _SubwayRealtimeSearchScreenState();
}

class _SubwayRealtimeSearchScreenState
    extends State<SubwayRealtimeSearchScreen> {
  final _controller = TextEditingController();
  final _debounce = Debounce(milliseconds: 500);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubwayViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '지하철 실시간 검색',
        ),
      ),
      body: Column(children: [
        TextField(
          controller: _controller,
          onChanged: _debounce.run(() => viewModel.fetchInfo(_controller.text)),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2),
            ),
            hintText: '지하철역을 입력하세요',
          ),
        ),
        Expanded(
          child: ListView(
            children: viewModel.arrivalInfo.map((Subway arrivalInfo) {
              return Column(
                children: [
                  Text(arrivalInfo.heading),
                  Text(arrivalInfo.arrivalMessage),
                ],
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
