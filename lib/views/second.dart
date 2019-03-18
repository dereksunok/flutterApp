import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('widget.title 2'),
      ),
      body: new Center(
        child: new Row(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {},
                  child: const Text('get data'),
                )
              ]
            ),
            new Column(
              children: <Widget>[
                new Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 200.0,
                )
              ]
            )
          ]
        )
        
      ),
    );
  }
}
