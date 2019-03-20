import 'package:flutter/material.dart';
import 'package:app/config/config.dart' ;

import './views/first.dart';
import './views/second.dart';
import './views/socket.dart';
// import './views/third.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    new FirstPage(),
    new SecondPage(),
    new WebSocketRoute(),
    // new ThirdPage(),
  ];

  @override
  void initState() {
    print(Config.apiHost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'), backgroundColor: Colors.orange),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business'), backgroundColor: Colors.orange),
          BottomNavigationBarItem(icon: Icon(Icons.score), title: Text('socket'), backgroundColor: Colors.orange),
          // BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School'), backgroundColor: Colors.orange),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.orangeAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}