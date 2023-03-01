import 'dart:io';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  var env=DotEnv(includePlatformEnvironment: true)..load();
  env.isEveryDefined(['FOO']);
  runApp(MyApp());
  print('HELLO ${env['FOO']}');

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
