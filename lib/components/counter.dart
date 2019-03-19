import 'package:flutter/material.dart';
import '../utils/event.dart';

class CounterSize extends StatefulWidget {
  CounterSize({Key key}) : super(key: key);

  @override
  _CounterSizeState createState() => new _CounterSizeState();
}

class _CounterSizeState extends State<CounterSize> {
  var count = 0;

  @override
  void initState() {
    super.initState();
    print("initState: $count");

    bus.emit("login", 'userInfo');
  }

  changeCounter() {
    print('changeCounter');
    setState(()=> ++count);
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child:  new RaisedButton(
          onPressed:()=> changeCounter(),
          child: new Text('count: $count'),
        ),
      );
  }
  
  @override
  void didUpdateWidget(CounterSize oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}