import 'package:flutter/material.dart';
import './views/first.dart';
import './views/second.dart';
import './views/third.dart';
import './views/socket.dart';

void main() => runApp(new MyApp());

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

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//   TabController controller;

//   @override
//   void initState() {
//     controller = new TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new TabBarView(
//         controller: controller,
//         children: <Widget>[
//           new Text('widget.title 1'),
//           new Text('widget.title 2'),
//           new Text('widget.title 3'),
//           // new FirstPage(),
//           // new SecondPage(),
//           // new ThirdPage()
//         ],
//       ),
//       bottomNavigationBar: new Material(
//         color: Colors.orangeAccent,
//         child: new TabBar(
//           controller: controller,
//           tabs: <Tab>[
//             new Tab(text: '111', icon: new Icon(Icons.home)),
//             new Tab(text: '222', icon: new Icon(Icons.message)),
//             new Tab(text: '333', icon: new Icon(Icons.send)),
//           ],
//         )
//       ),
//     );
//   }
// }