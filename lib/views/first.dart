import 'package:flutter/material.dart';
import '../components/list.dart';

class FirstPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DoubanTheatersWidget(),
    );
  }
}
