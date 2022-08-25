import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_search_app/ui/subway_screen.dart';
import 'package:subway_search_app/ui/subway_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SubwayViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SubwayRealtimeSearchScreen(),
    );
  }
}
