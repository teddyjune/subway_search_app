import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_search_app/data/model/subway.dart';
import 'package:subway_search_app/debounce.dart';
import 'package:subway_search_app/ui/subway_view_model.dart';

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
          '서울 지하철 실시간 알리미',
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _controller,
            onChanged:
                _debounce.run(() => viewModel.fetchInfo(_controller.text)),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2),
              ),
              hintText: '지하철역을 입력하세요',
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: viewModel.arrivalInfo.map((Subway arrivalInfo) {
              return Column(
                children: [
                  Text(
                    arrivalInfo.heading,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(arrivalInfo.arrivalMessage),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
