import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyTask());
}

class MyTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

