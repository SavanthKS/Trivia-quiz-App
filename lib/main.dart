import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/api_provider.dart';
import '/screen/screen_one.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ApiProvider())],
      child: MaterialApp(
        title: "Trivia",
        home: const ScreenOne(),
        theme: ThemeData(
          primarySwatch: Colors.amber,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true),
        ),
      ),
    );
  }
}
