import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/event.dart';
import '../config/config.dart' ;



class ListTheatersWidget extends StatefulWidget {
  final String title;
  ListTheatersWidget({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomeAppState();
  }
}

class _MyHomeAppState extends State<ListTheatersWidget> {
  List subjects = [];
  String title = '';
  var login = '';

  @override
  void initState() {
    loadData();
    //监听登录事件
    if(login == '') {
      bus.on("login", (arg) {
        login = 'on login $arg';
        print(login);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: getBody(),
      ),
    );
  }

  loadData() async {
    String loadRUL = Config.apiHost+'/get';
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      title = result['title'];
      print('title: $title');
      subjects = result['subjects'];
    });
  }

  getItem(var subject) {
  //  演员列表
    var avatars = List.generate(subject['casts'].length, (int index) =>
        Container(
          margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),

          child: CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage(
                  subject['casts'][index]['avatars']['small']
              )
          ),
        ),
    );
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              subject['images']['large'],
              width: 100.0, height: 150.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                    电影名称
                    Text(
                      subject['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
//                    豆瓣评分
                    Text(
                      '豆瓣评分：${subject['rating']['average']}',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    ),
//                    类型
                    Text(
                        "类型：${subject['genres'].join("、")}"
                    ),
//                    导演
                    Text(
                        '导演：${subject['directors'][0]['name']}'
                    ),
//                    演员
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text('主演：'),
                          Row(
                            children: avatars,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  getBody() {
    if (subjects.length != 0) {
      return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(subjects[position]);
          });
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }
}