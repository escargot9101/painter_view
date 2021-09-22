import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paint_view_example/app/view/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        cupertinoOverrideTheme: const CupertinoThemeData(),
      ),
      home: const HomePage(),
    );
  }
}
