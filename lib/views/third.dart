import 'package:flutter/material.dart';
import '../components/counter.dart';

class ThirdPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('widget.title 3'),
      ),
      body: new CounterSize(),
    );
  }
}
